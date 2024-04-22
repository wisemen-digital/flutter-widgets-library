import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_alert_dialog.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

Future<void> showPlatformAlertDialog({
  required BuildContext context,
  required String title,
  required List<MaterialButton> actions,
  String? subtitle,
  bool isDismissable = false,
}) async {
  if (kIsWeb) {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title),
        content: subtitle != null ? Text(subtitle) : null,
        actions: actions.map((action) => action).toList(),
      ),
      barrierDismissible: isDismissable,
    );
  } else if (Platform.isIOS || Platform.isMacOS) {
    await showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoTheme(
        data: const CupertinoThemeData(),
        child: PlatformAlertDialog(
          title: title,
          message: subtitle,
          actions: actions,
        ),
      ),
      barrierDismissible: isDismissable,
    );
  } else {
    await showDialog<void>(
      context: context,
      builder: (context) => PlatformAlertDialog(
        title: title,
        message: subtitle,
        actions: actions,
      ),
      barrierDismissible: isDismissable,
    );
  }
}

Future<void> showPlatformConfirmAlertDialog({
  required BuildContext context,
  required FutureOr<void> Function() confirmAction,
  String? title,
  String? subtitle,
  FutureOr<void> Function()? cancelAction,
  bool isDismissable = true,
  bool isDelete = true,
  String? cancelTitle,
  String? confirmTitle,
}) async {
  title ??= Swl.of(context).confirm;
  await showPlatformAlertDialog(
    context: context,
    title: title,
    subtitle: subtitle,
    actions: [
      MaterialButton(
        padding: kIsWeb ? const EdgeInsets.all(20) : null,
        child: Text(cancelTitle ?? Swl.of(context).cancel),
        onPressed: () async {
          if (cancelAction != null) {
            await cancelAction();
          } else {
            Navigator.of(context, rootNavigator: true).pop();
          }
        },
      ),
      MaterialButton(
        padding: kIsWeb ? const EdgeInsets.all(20) : null,
        child: Text(
          confirmTitle ??
              (isDelete ? Swl.of(context).delete : Swl.of(context).yes),
          style: isDelete
              ? const TextStyle(color: CupertinoColors.destructiveRed)
              : null,
        ),
        onPressed: () async {
          Navigator.of(context, rootNavigator: true).pop();
          await confirmAction();
        },
      ),
    ],
    isDismissable: isDismissable,
  );
}
