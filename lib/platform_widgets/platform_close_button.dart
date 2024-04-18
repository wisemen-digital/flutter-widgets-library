import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_widgets.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

class PlatformCloseButton extends PlatformWidget<CupertinoButton, Material> {
  const PlatformCloseButton({
    super.key,
    this.title,
    this.textStyle,
    this.onPressed,
    this.color = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.iconHeight = 32,
    this.border,
    this.iconSize = 22,
  });
  final String? title;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final double iconHeight;
  final Border? border;
  final double? iconSize;

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      onPressed:
          onPressed ?? () => Navigator.of(context, rootNavigator: true).pop(),
      child: AutoSizeText(
        title ?? Swl.of(context).close,
        style: textStyle,
        maxLines: 1,
      ),
    );
  }

  @override
  Material createMaterialWidget(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: title != null
          ? InkWell(
              onTap: onPressed ??
                  () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
              child: Ink(
                child: AutoSizeText(
                  title!,
                  style: textStyle,
                  maxLines: 1,
                ),
              ),
            )
          : InkWell(
              borderRadius: BorderRadius.circular(iconHeight),
              onTap: onPressed ??
                  () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
              child: Ink(
                height: iconHeight,
                width: iconHeight,
                child: Icon(
                  Icons.close_rounded,
                  color: color,
                  size: iconSize,
                ),
              ),
            ),
    );
  }
}
