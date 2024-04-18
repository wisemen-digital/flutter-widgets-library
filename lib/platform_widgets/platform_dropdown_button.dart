import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:wisewidgetslibrary/constants/app_sizes.dart';
import 'package:wisewidgetslibrary/models/dropdown_object.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_widget.dart';

class PlatformDropDownButton extends PlatformWidget<Column, Column> {
  const PlatformDropDownButton({
    required this.items,
    required this.item,
    required this.onChanged,
    super.key,
    this.bgColor = Colors.white,
    this.topText,
    this.isDisabled = false,
    this.radius = 8,
    this.hintText,
    this.isOptional = false,
    this.boxShadow,
    this.borderColor = Colors.black,
    this.topTextStyle,
    this.hintTextStyle,
    this.itemStyle = const TextStyle(color: Colors.black),
    this.icon,
    this.isSelectable = false,
  });
  final List<DropdownObject> items;
  final DropdownObject? item;
  final String? topText;
  final String? hintText;
  final bool isOptional;
  final Color bgColor;
  final Color borderColor;
  final double radius;
  final bool isDisabled;
  final void Function(DropdownObject) onChanged;
  final List<BoxShadow>? boxShadow;
  final TextStyle? topTextStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? itemStyle;
  final Widget? icon;
  final bool isSelectable;

  @override
  Column createCupertinoWidget(BuildContext context) {
    final pullDownMenuItems = <PullDownMenuEntry>[];
    for (final item in items) {
      pullDownMenuItems.add(
        isSelectable
            ? PullDownMenuItem.selectable(
                selected: item == this.item,
                onTap: () => onChanged(item),
                title: item.value,
              )
            : PullDownMenuItem(onTap: () => onChanged(item), title: item.value),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topText != null)
          Text(
            topText!,
            style: topTextStyle,
          ),
        if (topText != null) gapH6,
        PullDownButton(
          scrollController: ScrollController(),
          itemBuilder: (context) => pullDownMenuItems,
          buttonBuilder: (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            padding: EdgeInsets.zero,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
              decoration: BoxDecoration(
                color: isDisabled ? Colors.black.withOpacity(0.1) : bgColor,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(color: borderColor),
                boxShadow: boxShadow,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      (item?.value.isNotEmpty ?? false)
                          ? item!.value
                          : hintText ?? topText ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: (item?.value.isNotEmpty ?? false)
                          ? itemStyle
                          : hintTextStyle,
                    ),
                  ),
                  gapW10,
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                    child: icon ??
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Column createMaterialWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topText != null)
          Text.rich(
            TextSpan(
              text: topText,
              children: [
                if (isOptional) const TextSpan(text: '*'),
              ],
            ),
            style: topTextStyle,
          ),
        if (topText != null) gapH6,
        Ink(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: isDisabled ? Colors.black.withOpacity(0.1) : bgColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor),
            boxShadow: boxShadow,
          ),
          child: ButtonTheme(
            height: 48,
            alignedDropdown: true,
            child: DropdownButton(
              hint: Text(hintText ?? topText ?? '', style: hintTextStyle),
              value:
                  items.firstWhereOrNull((element) => element.key == item?.key),
              isExpanded: true,
              style: itemStyle,
              underline: const SizedBox(),
              icon: icon ??
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.black,
                  ),
              dropdownColor: bgColor,
              borderRadius: BorderRadius.circular(radius > 0 ? radius - 1 : 0),
              items: items.isNotEmpty
                  ? items.map<DropdownMenuItem<DropdownObject>>(
                      (DropdownObject dropdownObject) {
                      return DropdownMenuItem<DropdownObject>(
                        value: dropdownObject,
                        child: Text(
                          dropdownObject.value,
                          style: itemStyle,
                        ),
                      );
                    }).toList()
                  : null,
              onChanged: (selectedItem) {
                if (selectedItem != null) {
                  onChanged(selectedItem);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
