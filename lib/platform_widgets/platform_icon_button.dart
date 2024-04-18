import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformIconButton extends PlatformWidget<CupertinoButton, Material> {
  const PlatformIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.backgroundColor = Colors.transparent,
    this.splashColor,
    this.splashRadius,
  });
  final Widget icon;
  final Color backgroundColor;
  final void Function()? onPressed;
  final Color? splashColor;
  final double? splashRadius;

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) =>
      CupertinoButton(
        onPressed: onPressed,
        color: backgroundColor,
        padding: EdgeInsets.zero,
        minSize: 5,
        child: icon,
      );

  @override
  Material createMaterialWidget(BuildContext context) => Material(
        color: backgroundColor,
        child: IconButton(
          icon: icon,
          splashColor: splashColor,
          splashRadius: splashRadius,
          onPressed: onPressed,
        ),
      );
}
