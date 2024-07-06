import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class SelectionBottomSheet<T> extends StatelessWidget {
  SelectionBottomSheet(
      {Key? key,
      required this.itemAsString,
      required this.selectedItem,
      required this.onChange,
      required this.items,
      this.hintText,
      this.onClearFn,
      this.searchHintText,
      this.validator,
      this.filled = false,
      this.fillColor,
      this.enabled = true,
      this.style,
      this.showClearButton = false,
      this.notFound,
      this.title,
      this.showSearch = true,
      this.mandatory = false,
      this.hintStyle})
      : super(key: key);
  final String Function(T)? itemAsString;
  final T? selectedItem;
  final void Function(T?)? onChange;
  final List<T> items;
  final String? hintText;
  final Function()? onClearFn;
  final String? searchHintText;
  final String? Function(T?)? validator;
  final bool? filled;
  final Color? fillColor;
  final bool enabled;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool showClearButton;
  final bool? showSearch;
  final bool? mandatory;
  final String? notFound;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Row(
            children: [
              Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColors.textColor),
              ),
              if (mandatory!)
                Text(
                  '*',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.redColor),
                ),
            ],
          ),
        // SizedBox(
        //   height: 10.h,
        // ),
        SizedBox(
          height: 48.h,
          width: 247.w,
          child: DropdownSearch<T>(
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    left: 16.w, right: 16.w, bottom: 12.h, top: 12.h),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: AppColors.borderColor, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: AppColors.borderColor, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                hintText: hintText,
                fillColor: fillColor,
                suffixStyle: style,
                filled: filled,
              ),
            ),
            enabled: enabled,
            compareFn: (i, s) => i == s,
            selectedItem: selectedItem,
            itemAsString: itemAsString,
            onChanged: onChange,
            items: items,
            validator: validator,
            clearButtonProps: ClearButtonProps(
              onPressed: onClearFn,
              isVisible: showClearButton,
            ),
            popupProps: PopupProps.menu(
              isFilterOnline: true,
              showSelectedItems: true,
              showSearchBox: showSearch!,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: searchHintText ?? "search",
                  focusColor: AppColors.borderColor,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
