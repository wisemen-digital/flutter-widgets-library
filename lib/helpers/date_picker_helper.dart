import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/constants/platform_constants.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

Future<DateTime?> showPlatformDatePicker({
  required BuildContext context,
  DateTime? selectedDate,
  DateTime? minDate,
  DateTime? maxDate,
  Color? color,
  Color? backgroundColor = Colors.white,
}) async {
  DateTime? newDate;
  newDate ??= DateTime.now();
  var isChanged = false;

  if (isIos) {
    return showCupertinoModalPopup<DateTime?>(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: backgroundColor,
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
                    if (!isChanged && selectedDate != null) {
                      newDate = selectedDate;
                    }
                    Navigator.of(context).pop(newDate);
                  },
                ),
              ],
            ),
            Flexible(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (selectedDate) {
                  isChanged = true;
                  newDate = selectedDate;
                },
                minimumDate: minDate,
                maximumDate: maxDate,
                initialDateTime: selectedDate,
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return showDatePicker(
      context: context,
      firstDate: minDate ?? DateTime(1900),
      initialDate: selectedDate ?? DateTime.now(),
      lastDate: maxDate ??
          DateTime.now().add(
            const Duration(days: 730),
          ),
      builder: (context, child) {
        return child!;
      },
    );
  }
}

Future<TimeOfDay?> showPlatformTimePicker({
  required BuildContext context,
  TimeOfDay? selectedTime,
  Color? color,
}) async {
  TimeOfDay? newDate;
  final now = DateTime.now();
  newDate ??= selectedTime ?? TimeOfDay.fromDateTime(now);

  if (Platform.isIOS || Platform.isMacOS) {
    return showCupertinoModalPopup<TimeOfDay?>(
      context: context,
      builder: (context) => CupertinoTheme(
        data: const CupertinoThemeData(),
        child: Container(
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
                      Navigator.of(context).pop(newDate);
                    },
                  ),
                ],
              ),
              Flexible(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: MediaQuery.of(context).alwaysUse24HourFormat,
                  onDateTimeChanged: (selectedDate) =>
                      newDate = TimeOfDay.fromDateTime(selectedDate),
                  initialDateTime: DateTime(
                    now.year,
                    now.month,
                    now.day,
                    selectedTime?.hour ?? now.hour,
                    selectedTime?.minute ?? now.minute,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } else {
    return showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: color != null
                ? ColorScheme.light(
                    primary: color,
                    primaryContainer: color.withOpacity(0.2),
                  )
                : null,
          ),
          child: child!,
        );
      },
    );
  }
}
