import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

import 'platform_widget.dart';

// ignore: must_be_immutable
class PlatformPicker<T> extends PlatformWidget<Widget, Widget> {
  PlatformPicker({required this.newValue, super.key});
  T? newValue;

  @override
  Widget createCupertinoWidget(BuildContext context) => Container(
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
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (selectedDate) =>
                    newValue = selectedDate as T?,
              ),
            ),
          ],
        ),
      );

  @override
  Widget createMaterialWidget(BuildContext context) => Material(
        color: Colors.transparent,
        child: DatePickerDialog(
          firstDate: DateTime.now()..add(const Duration(days: 10)),
          initialDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(milliseconds: 1)),
        ),
      );
}
