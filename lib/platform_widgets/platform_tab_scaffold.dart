import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_bottom_bar.dart';
import 'platform_widget.dart';

class PlatformTabScaffold
    extends PlatformWidget<CupertinoTabScaffold, Scaffold> {
  const PlatformTabScaffold({
    required this.index,
    required this.body,
    required this.bottomBar,
    required this.tabBuilder,
    super.key,
  });
  final PlatformBottomBar bottomBar;
  final Widget Function(BuildContext, int) tabBuilder;
  final Widget body;
  final int index;

  @override
  CupertinoTabScaffold createCupertinoWidget(BuildContext context) =>
      CupertinoTabScaffold(
        tabBar: bottomBar.createCupertinoWidget(context),
        tabBuilder: tabBuilder,
      );

  @override
  Scaffold createMaterialWidget(BuildContext context) => Scaffold(
        body: body,
        bottomNavigationBar: bottomBar,
      );
}
