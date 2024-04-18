import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/constants/platform_constants.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

Future<T?> showPlatformPicker<T>({
  required BuildContext context,
  required List<T?> items,
  int? index,
}) async {
  T? newValue;

  if (isIos) {
    return showCupertinoModalPopup<T?>(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: Text(Swl.of(context).cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoButton(
                  child: Text(Swl.of(context).save),
                  onPressed: () {
                    Navigator.of(context).pop(newValue);
                  },
                ),
              ],
            ),
            Flexible(
              child: SizedBox(
                height: 200,
                child: CupertinoPicker(
                  scrollController:
                      FixedExtentScrollController(initialItem: index ?? 0),
                  itemExtent: 50,
                  onSelectedItemChanged: (int value) {
                    newValue = items[value];
                  },
                  backgroundColor: Colors.white,
                  children: items
                      .map((e) => Center(child: Text(e.toString())))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  return null;
}
