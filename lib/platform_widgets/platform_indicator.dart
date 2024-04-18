import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformLoadingIndicator
    extends PlatformWidget<CupertinoActivityIndicator, SizedBox> {
  const PlatformLoadingIndicator({
    super.key,
    this.radius = 10.0,
    this.color,
  });
  final double radius;
  final Color? color;

  @override
  CupertinoActivityIndicator createCupertinoWidget(BuildContext context) =>
      CupertinoActivityIndicator(
        radius: radius,
        color: color,
      );

  @override
  SizedBox createMaterialWidget(BuildContext context) {
    return SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(color),
        strokeWidth: radius / 4,
      ),
    );
  }
}
