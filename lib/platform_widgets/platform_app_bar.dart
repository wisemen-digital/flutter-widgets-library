import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

import 'platform_widget.dart';

class PlatformAppBar extends PlatformWidget<Widget, AppBar>
    implements ObstructingPreferredSizeWidget {
  const PlatformAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.previousPageTitle,
    this.backgroundColor,
    this.showBorder = false,
    this.iconTheme,
    this.brightness,
    this.canGoBack = true,
    this.border,
    this.height,
    this.androidCenterTitle,
    this.transitionBetweenRoutes = true,
  });
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final String? previousPageTitle;
  final Color? backgroundColor;
  final bool showBorder;
  final IconThemeData? iconTheme;
  final bool canGoBack;
  final Brightness? brightness;
  final double? height;
  final Border? border;
  final bool? androidCenterTitle;
  final bool transitionBetweenRoutes;

  @override
  Widget createCupertinoWidget(BuildContext context) => SizedBox(
        height: height,
        child: CupertinoNavigationBar(
          transitionBetweenRoutes: transitionBetweenRoutes,
          border:
              showBorder ? border ?? const Border(bottom: BorderSide()) : null,
          backgroundColor: backgroundColor ?? Colors.white,
          previousPageTitle: previousPageTitle ?? Swl.of(context).back,
          leading: leading,
          automaticallyImplyLeading: canGoBack,
          middle: title,
          padding: EdgeInsetsDirectional.zero,
          trailing: actions != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions!.map((e) => Flexible(child: e)).toList(),
                  ),
                )
              : null,
          brightness: brightness,
        ),
      );

  @override
  AppBar createMaterialWidget(BuildContext context) => AppBar(
        iconTheme: iconTheme,
        shape: showBorder ? border ?? const Border(bottom: BorderSide()) : null,
        backgroundColor: kIsWeb ? Colors.white : backgroundColor,
        leading: leading,
        title: title,
        actions: actions,
        centerTitle: androidCenterTitle,
        automaticallyImplyLeading: canGoBack,
        toolbarHeight: height,
      );

  @override
  Size get preferredSize => Size.fromHeight(
        Platform.isIOS ? kMinInteractiveDimensionCupertino : kToolbarHeight,
      );

  @override
  bool shouldFullyObstruct(BuildContext context) => false;
}
