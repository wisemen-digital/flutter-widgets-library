import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformBottomBar extends PlatformWidget<CupertinoTabBar, Widget> {
  const PlatformBottomBar({
    required this.items,
    required this.onTap,
    required this.currentIndex,
    required this.inActiveColor,
    super.key,
    this.activeColor,
  });
  final List<BottomNavigationBarItem> items;
  final void Function(int) onTap;
  final int currentIndex;
  final Color? activeColor;
  final Color? inActiveColor;

  @override
  CupertinoTabBar createCupertinoWidget(BuildContext context) =>
      CupertinoTabBar(
        currentIndex: currentIndex,
        items: items,
        onTap: onTap,
        activeColor: activeColor,
        inactiveColor: inActiveColor ?? CupertinoColors.inactiveGray,
        backgroundColor: Colors.white,
      );

  @override
  BottomNavigationBar createMaterialWidget(BuildContext context) =>
      BottomNavigationBar(
        items: items,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: activeColor,
        unselectedItemColor: inActiveColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      );
}
