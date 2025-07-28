import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text_field.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.items,
    required this.string,
    required this.onChanged,
    this.selectedItem,
    this.selectedString,
    this.labelText,
    this.hintText,
    this.error = false,
    this.fieldTitle,
    this.isRequired = false,
    this.padding,
    this.validator,
    this.addNewPressed,
    this.readOnly = false,
    this.showSearch = true,
  });

  final List<T> items;
  final T? selectedItem;
  final String Function(T item) string;
  final String Function(T item)? selectedString;
  final void Function(T? value)? onChanged;
  final String? labelText;
  final String? hintText;
  final bool error;
  final String? fieldTitle;
  final bool isRequired;
  final EdgeInsetsGeometry? padding;
  final String? Function(T? value)? validator;
  final void Function()? addNewPressed;
  final bool readOnly;
  final bool showSearch;

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
          padding: padding,
          readOnly: true,
          onTap: () => _showBottomSheet(context),
          controller: TextEditingController(
            text: selectedItem != null
                ? selectedString != null
                      ? selectedString!(selectedItem as T)
                      : string(selectedItem as T)
                : '',
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
            // final item =
            //     items.where((element) => string(element) == value).firstOrNull;

            return validator?.call(selectedItem);
          },
        ),
        // if (validator != null && error)
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

    if (readOnly) {
      return;
    }

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DropDownBottomSheetContent<T>(
          title: fieldTitle ?? labelText ?? hintText ?? '',
          items: items,
          string: string,
          onChanged: onChanged,
          selectedItem: selectedItem,
          addNewPressed: addNewPressed,
          showSearch: showSearch,
        );
      },
    );
  }
}

class DropDownBottomSheetContent<T> extends StatefulWidget {
  const DropDownBottomSheetContent({
    super.key,
    required this.title,
    required this.items,
    required this.string,
    required this.onChanged,
    this.selectedItem,
    this.addNewPressed,
    this.showSearch = true,
  });

  final String title;
  final List<T> items;
  final T? selectedItem;
  final String Function(T item) string;
  final void Function(T? value)? onChanged;
  final void Function()? addNewPressed;
  final bool showSearch;

  @override
  State<DropDownBottomSheetContent<T>> createState() =>
      _DropDownBottomSheetContentState<T>();
}

class _DropDownBottomSheetContentState<T>
    extends State<DropDownBottomSheetContent<T>> {
  late List<T> filteredItems;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = widget.items
          .where(
            (item) =>
                widget.string(item).toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 16,
        left: 16,
        right: 16,
        // top: widget.addNewPressed == null ? 16 : 8,
      ),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      constraints: BoxConstraints(
        maxHeight: context.screenHeight * 0.5,
        minHeight: context.screenHeight * 0.4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: AppText(
                    text: widget.title,
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ),
              if (widget.addNewPressed != null)
                IconButton(
                  onPressed: widget.addNewPressed,
                  icon: const Icon(Icons.add),
                ),
            ],
          ),
          if (widget.addNewPressed == null) AppSpaces.v8 else AppSpaces.v8,
          if (widget.showSearch)
            AppTextField(
              controller: _searchController,
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.search),
              ),
              hintText: context.appLocalizations.search,
              onChanged: _filterItems,
            ),
          AppSpaces.v8,
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                final selected = item == widget.selectedItem;

                return InkWell(
                  onTap: () {
                    if (widget.selectedItem == item) {
                      Navigator.pop(context);
                      return;
                    }

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
