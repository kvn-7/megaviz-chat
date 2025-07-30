import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_alert_sheet.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_button.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_empty_widget.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_image.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_loader.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/auth_user_provider.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/sign_out_state_provider.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: AppBar(title: AppText(text: context.appLocalizations.profile)),
      body: ref
          .watch(authUserProvider)
          .when(
            data: (user) {
              if (user == null) {
                return AppEmptyWidget();
              }

              return Column(
                children: [
                  AppImage.network(
                    url: user.photoUrl,
                    height: 100,
                    width: 100,
                    radius: BorderRadius.circular(100),
                  ),
                  AppSpaces.v16,
                  AppText(
                    text: user.name,
                    style: context.textTheme.titleMedium,
                  ),
                  AppSpaces.v8,
                  AppText(
                    text: user.email,
                    style: context.textTheme.bodyMedium,
                  ),
                  AppSpaces.v16,
                  AppButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AppAlertSheet(
                            title: context.appLocalizations.logoutAlertTitle,
                            message:
                                context.appLocalizations.logoutAlertMessage,
                            actionButtonText: context.appLocalizations.logout,
                            onOverride: () {
                              ref.read(signOutStateProvider.notifier).signOut();
                            },
                          );
                        },
                      );
                    },
                    text: context.appLocalizations.logout,
                  ),
                ],
              );
            },
            error: (error, _) => AppEmptyWidget(),
            loading: () => AppLoader(),
          ),
    );
  }
}
