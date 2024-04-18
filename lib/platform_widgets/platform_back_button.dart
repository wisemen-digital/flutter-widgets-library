import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_widgets.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

class PlatformBackButton
    extends PlatformWidget<CupertinoNavigationBarBackButton, Material> {
  const PlatformBackButton({
    super.key,
    this.previousPageTitle,
    this.onPressed,
    this.color = Colors.black,
    this.iconSize = 24,
  });
  final String? previousPageTitle;
  final void Function()? onPressed;
  final Color? color;
  final double iconSize;

  @override
  CupertinoNavigationBarBackButton createCupertinoWidget(BuildContext context) {
    return CupertinoNavigationBarBackButton(
      previousPageTitle: previousPageTitle ?? Swl.of(context).back,
      color: color,
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }

  @override
  Material createMaterialWidget(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IconButton(
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_rounded,
          color: color,
          size: iconSize,
        ),
      ),
    );
  }
}
