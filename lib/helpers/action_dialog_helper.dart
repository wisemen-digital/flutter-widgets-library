import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/constants/platform_constants.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_action_dialog.dart';

Future<void> showPlatformActionDialog({
  required BuildContext context,
  required String title,
  required List<Widget> actions,
  required List<void Function()> functions,
  BorderRadius borderRadius = const BorderRadius.vertical(
    top: Radius.circular(20),
  ),
}) async {
  if (isIos) {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => PlatformActionDialog(
        title: title,
        actions: actions,
        functions: functions,
      ),
    );
  } else {
    await showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      builder: (context) => PlatformActionDialog(
        title: title,
        actions: actions,
        functions: functions,
      ),
    );
  }
}
