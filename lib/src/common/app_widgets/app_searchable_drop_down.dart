import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_button.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text_field.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppSearchableDropDown<T> extends StatelessWidget {
  const AppSearchableDropDown({
    super.key,
    required this.items,
    required this.string,
    required this.onChanged,
    this.selectedItem,
    this.labelText,
    this.hintText,
    this.error = false,
    this.fieldTitle,
    this.isRequired = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.validator,
    this.addNewPressed,
    this.searchHintText,
    required this.onSearch,
  });

  final List<T> items;
  final T? selectedItem;
  final String Function(T item) string;
  final void Function(T? value)? onChanged;
  final String? labelText;
  final String? hintText;
  final String? searchHintText;
  final bool error;
  final String? fieldTitle;
  final bool isRequired;
  final EdgeInsetsGeometry padding;
  final String? Function(T? value)? validator;
  final Future<T?> Function(String? text)? addNewPressed;
  final Future<List<T>> Function(String searchText) onSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: AppText(
                  text: fieldTitle!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              if (isRequired)
                AppText(
                  text: ' *',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.red),
                ),
            ],
          ),
          AppSpaces.v8,
        ],
        AppTextField(
          readOnly: true,
          onTap: () => _showBottomSheet(context),
          controller: TextEditingController(
            text: selectedItem != null ? string(selectedItem as T) : '',
          ),
          labelText: labelText != null
              ? isRequired
                    ? '${labelText!}*'
                    : labelText
              : null,
          hintText: hintText,
          suffix: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.arrow_drop_down),
          ),
          validator: (value) {
            return validator?.call(selectedItem);
          },
          // validator:
          //     validator != null ? (value) => validator!(value as T?) : null,
        ),
        // if (validator != null && validator!(selectedItem) != null)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 4),
        //     child: AppText(
        //       text: validator!(selectedItem) ?? '',
        //       style: Theme.of(context).inputDecorationTheme.errorStyle,
        //     ),
        //   ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    // if (items.isEmpty) return;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _BottomSheetContent<T>(
          title: fieldTitle ?? labelText ?? hintText ?? '',
          items: items,
          string: string,
          onChanged: onChanged,
          selectedItem: selectedItem,
          addNewPressed: addNewPressed,
          onSearch: onSearch,
          searchHintText: searchHintText,
        );
      },
    );
  }
}

class _BottomSheetContent<T> extends StatefulWidget {
  const _BottomSheetContent({
    super.key,
    required this.title,
    required this.items,
    required this.string,
    required this.onChanged,
    required this.onSearch,
    this.selectedItem,
    this.addNewPressed,
    this.searchHintText,
  });

  final String title;
  final List<T> items;
  final T? selectedItem;
  final String Function(T item) string;
  final void Function(T? value)? onChanged;
  final Future<T?> Function(String? text)? addNewPressed;
  final Future<List<T>> Function(String searchText) onSearch;
  final String? searchHintText;

  @override
  _BottomSheetContentState<T> createState() => _BottomSheetContentState<T>();
}

class _BottomSheetContentState<T> extends State<_BottomSheetContent<T>> {
  late List<T> filteredItems;
  final TextEditingController _searchController = TextEditingController();

  bool addingNew = false;

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    if (widget.selectedItem != null) {
      _searchController.text = widget.string(widget.selectedItem as T);
    }
  }

  Future<void> _filterItems(String query) async {
    filteredItems = await widget.onSearch(query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      margin: MediaQuery.of(context).viewInsets,
      padding: const EdgeInsets.only(
        bottom: 16,
        left: 16,
        right: 16,
        // top: widget.addNewPressed == null ? 16 : 8,
      ),
      constraints: BoxConstraints(maxHeight: context.screenHeight * 0.6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: AppText(
                    text: widget.title,
                    style: context.textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
          if (widget.addNewPressed == null) AppSpaces.v16 else AppSpaces.v8,
          AppTextField(
            controller: _searchController,
            prefix: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.search),
            ),
            hintText: widget.searchHintText ?? context.appLocalizations.search,
            onChanged: _filterItems,
            suffix:
                (widget.addNewPressed != null &&
                    _searchController.text.isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AppButton(
                      onPressed: () async {
                        addingNew = true;
                        setState(() {});

                        final item = await widget.addNewPressed?.call(
                          _searchController.text.trim(),
                        );

                        addingNew = false;

                        if (item != null) {
                          widget.onChanged?.call(item);
                        }

                        if (context.mounted) {
                          setState(() {});
                          Navigator.pop(context);
                        }
                      },
                      text: context.appLocalizations.add,
                      smallButton: true,
                      isLoading: addingNew,
                    ),
                  )
                : null,
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                final selected = item == widget.selectedItem;

                return InkWell(
                  onTap: () {
                    widget.onChanged?.call(item);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: AppText(
                      text: widget.string(item),
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: selected ? context.colorScheme.primary : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
