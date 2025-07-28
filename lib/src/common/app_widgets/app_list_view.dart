import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_empty_widget.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_loader.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/common/app_widgets/conditional_parent_widget.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppListView<T, Req, Res> extends ConsumerWidget {
  const AppListView({
    super.key,
    required this.listViewKey,
    required this.provider,
    required this.getTotal,
    required this.getPageSize,
    required this.getItems,
    required this.itemBuilder,
    this.separatorBuilder,
    this.refreshProvider,
    this.scrollable = true,
    this.showTotal = false,
  });

  final Key listViewKey;
  final ProviderOrFamily? refreshProvider;
  final ProviderListenable<AsyncValue<Res>> Function(int page) provider;
  final int Function(Res res) getTotal;
  final int Function(Res res) getPageSize;
  final List<T> Function(Res res) getItems;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final bool scrollable;
  final bool showTotal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(provider(1));

    return res.when(
      skipLoadingOnRefresh: false,
      data: (data) {
        final total = getTotal(data);
        final pageSize = getPageSize(data);

        if (total == 0) {
          return const AppEmptyWidget();
        }

        return Column(
          children: [
            if (showTotal) ...[
              Row(
                children: [
                  AppSpaces.h8,
                  AppText(
                    text: '${context.appLocalizations.total}:',
                    style: context.textTheme.titleMedium,
                  ),
                  AppSpaces.h8,
                  AppText(
                    text: total.toString(),
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
              AppSpaces.v8,
            ],
            Expanded(
              child: ConditionalParentWidget(
                condition: refreshProvider != null,
                parentBuilder: (context, child) => RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(refreshProvider!);
                  },
                  child: child,
                ),
                child: ListView.separated(
                  key: listViewKey,
                  itemCount: total,
                  shrinkWrap: !scrollable,
                  physics: scrollable
                      ? null
                      : const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;

                    final previousPageIsLoading =
                        page != 1 && ref.watch(provider(page - 1)).isLoading;

                    if (previousPageIsLoading) return null;

                    final responseAsync = ref.watch(provider(page));

                    return responseAsync.when(
                      error: (err, stack) => indexInPage == 0
                          ? const AppEmptyWidget()
                          : const SizedBox.shrink(),
                      loading: () =>
                          indexInPage == 0 ? const AppLoader() : null,
                      data: (response) {
                        final items = getItems(response);

                        if (indexInPage >= items.length) {
                          return const SizedBox.shrink();
                        }

                        return itemBuilder(context, items[indexInPage], index);
                      },
                    );
                  },
                  separatorBuilder: (context, index) =>
                      separatorBuilder?.call(context, index) ??
                      const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        );
      },
      error: (err, stack) => const AppEmptyWidget(),
      loading: () => const AppLoader(),
    );
  }
}
