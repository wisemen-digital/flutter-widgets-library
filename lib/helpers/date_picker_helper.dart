import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/wise_widgets_library.dart';

Future<DateTime?> showPlatformDatePicker({
  required BuildContext context,
  DateTime? selectedDate,
  DateTime? minDate,
  DateTime? maxDate,
  Color color = Colors.blue,
  Color backgroundColor = Colors.white,
}) async {
  DateTime? newDate;
  newDate ??= selectedDate;

  if (isIos) {
    // ignore: omit_local_variable_types
    const double height = 450;
    // ignore: omit_local_variable_types
    const double maxWidth = 400;
    const bottomPadding = 100;

    return showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Center(
            child: Dialog(
              insetPadding: pad20,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: maxWidth),
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: rad16,
                  ),
                  child: Padding(
                    padding: pad16,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height - bottomPadding,
                          child: UIDatePicker(
                            tintColor: color,
                            date: selectedDate,
                            minimumDate: minDate,
                            maximumDate: maxDate,
                            onChanged: (selectedDate) {
                              newDate = selectedDate;
                            },
                          ),
                        ),
                        gapH16,
                        PlatformButton.child(
                          color: color,
                          height: 48,
                          borderRadius: rad25,
                          child: Text(
                            Swl.of(context).ok,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CupertinoSystemDisplay',
                              fontSize: 15,
                              color: color.computeLuminance() > 0.5
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(newDate),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
