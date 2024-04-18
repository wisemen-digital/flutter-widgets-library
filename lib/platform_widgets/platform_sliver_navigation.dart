import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wisewidgetslibrary/constants/app_sizes.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_back_button.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_widget.dart';

class PlatformSliverNavigationBar extends PlatformWidget<Widget, Widget> {
  const PlatformSliverNavigationBar({
    super.key,
    this.leading,
    this.title,
    this.backgroundColor,
    this.leadingColor,
    this.previousTitle,
    this.hasBackButton = true,
    this.brightness,
    this.actions,
    this.roundedBorder = false,
    this.inBottomSheet = false,
    this.noElevation = false,
    this.iOSHasBackDrop = true,
    this.border,
    this.actionsHasPadding = true,
    this.titleWidget,
    this.minFontSize = Sizes.p16,
    this.maxFontSize = Sizes.p34,
    this.flexibleSpace,
    this.bottom,
    this.elevation = 0,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.forceElevated = false,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.collapsedHeight,
    this.expandedHeight = 100.0,
    this.floating = false,
    this.pinned = true,
    this.snap = false,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle = const TextStyle(fontWeight: FontWeight.bold),
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.maxLinesAndroid,
    this.onBackPressed,
  });
  final Widget? leading;
  final String? title;
  final Color? backgroundColor;
  final Color? leadingColor;
  final String? previousTitle;
  final bool hasBackButton;
  final Brightness? brightness;
  final List<Widget>? actions;
  final bool roundedBorder;
  final bool inBottomSheet;
  final bool noElevation;
  final bool iOSHasBackDrop;
  final Border? border;
  final bool actionsHasPadding;
  final Widget? titleWidget;
  final double minFontSize;
  final double maxFontSize;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final bool forceElevated;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double? collapsedHeight;
  final double? expandedHeight;
  final bool floating;
  final bool pinned;
  final bool snap;
  final bool stretch;
  final double stretchTriggerOffset;
  final Future<void> Function()? onStretchTrigger;
  final ShapeBorder? shape;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;
  final int? maxLinesAndroid;
  final void Function()? onBackPressed;

  @override
  SliverAppBar createCupertinoWidget(BuildContext context) =>
      SliverAppBar.large(
        title: flexibleSpace != null
            ? null
            : titleWidget ??
                AutoSizeText(
                  '$title',
                  maxLines: 1,
                  minFontSize: minFontSize,
                  maxFontSize: maxFontSize,
                  overflow: TextOverflow.ellipsis,
                  style: titleTextStyle,
                ),
        leading: hasBackButton
            ? leading ??
                PlatformBackButton(
                  color: leadingColor,
                  onPressed: () => onBackPressed != null
                      ? onBackPressed!()
                      : Navigator.of(context).pop(),
                )
            : null,
        backgroundColor: backgroundColor,
        actions: actions,
        automaticallyImplyLeading: hasBackButton,
        flexibleSpace: titleWidget != null ? null : flexibleSpace,
        bottom: bottom,
        elevation: elevation,
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        forceElevated: forceElevated,
        foregroundColor: foregroundColor,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        primary: primary,
        centerTitle: centerTitle ?? true,
        excludeHeaderSemantics: excludeHeaderSemantics,
        titleSpacing: titleSpacing,
        collapsedHeight: collapsedHeight,
        expandedHeight: expandedHeight,
        floating: floating,
        pinned: pinned,
        snap: snap,
        stretch: stretch,
        stretchTriggerOffset: stretchTriggerOffset,
        onStretchTrigger: onStretchTrigger,
        shape: border,
        toolbarHeight: toolbarHeight ?? const SliverAppBar().toolbarHeight,
        leadingWidth: leadingWidth ?? 80,
        toolbarTextStyle: toolbarTextStyle,
        titleTextStyle: titleTextStyle,
        systemOverlayStyle: systemOverlayStyle ??
            SystemUiOverlayStyle(
              statusBarBrightness: brightness,
              statusBarIconBrightness: brightness,
              systemNavigationBarIconBrightness: brightness,
            ),
        forceMaterialTransparency: forceMaterialTransparency,
        clipBehavior: clipBehavior,
      );

  @override
  SliverAppBar createMaterialWidget(BuildContext context) =>
      SliverAppBar.medium(
        title: flexibleSpace != null
            ? null
            : titleWidget ??
                AutoSizeText(
                  '$title',
                  maxLines: 1,
                  minFontSize: minFontSize,
                  maxFontSize: maxFontSize,
                  overflow: TextOverflow.ellipsis,
                  style: titleTextStyle,
                ),
        leading: hasBackButton
            ? Row(
                children: [
                  leading ??
                      PlatformBackButton(
                        color: leadingColor,
                        onPressed: () => onBackPressed != null
                            ? onBackPressed!()
                            : Navigator.of(context).pop(),
                      ),
                ],
              )
            : null,
        backgroundColor: backgroundColor,
        actions: actions,
        automaticallyImplyLeading: hasBackButton,
        flexibleSpace: titleWidget != null ? null : flexibleSpace,
        bottom: bottom,
        elevation: elevation,
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        forceElevated: forceElevated,
        foregroundColor: foregroundColor,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        primary: primary,
        centerTitle: centerTitle ?? true,
        excludeHeaderSemantics: excludeHeaderSemantics,
        titleSpacing: titleSpacing,
        collapsedHeight: collapsedHeight,
        expandedHeight: expandedHeight,
        floating: floating,
        pinned: pinned,
        snap: snap,
        stretch: stretch,
        stretchTriggerOffset: stretchTriggerOffset,
        onStretchTrigger: onStretchTrigger,
        shape: border,
        toolbarHeight: toolbarHeight ?? const SliverAppBar().toolbarHeight,
        leadingWidth: leadingWidth ?? 80,
        toolbarTextStyle: toolbarTextStyle,
        // titleTextStyle: titleTextStyle,
        systemOverlayStyle: systemOverlayStyle ??
            SystemUiOverlayStyle(
              statusBarBrightness: brightness,
              statusBarIconBrightness: brightness,
              systemNavigationBarIconBrightness: brightness,
            ),
        forceMaterialTransparency: forceMaterialTransparency,
        clipBehavior: clipBehavior,
      );

  PlatformSliverNavigationBar copyWith({
    Widget? leading,
    String? title,
    Color? backgroundColor,
    Color? leadingColor,
    String? previousTitle,
    bool? hasBackButton,
    Brightness? brightness,
    List<Widget>? actions,
    bool? roundedBorder,
    bool? inBottomSheet,
    bool? noElevation,
    bool? iOSHasBackDrop,
    Border? border,
    bool? actionsHasPadding,
    Widget? titleWidget,
    double? minFontSize,
    double? maxFontSize,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    double? elevation,
    double? scrolledUnderElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    bool? forceElevated,
    Color? foregroundColor,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    bool? primary,
    bool? centerTitle,
    bool? excludeHeaderSemantics,
    double? titleSpacing,
    double? collapsedHeight,
    double? expandedHeight,
    bool? floating,
    bool? pinned,
    bool? snap,
    bool? stretch,
    double? stretchTriggerOffset,
    Future<void> Function()? onStretchTrigger,
    ShapeBorder? shape,
    double? toolbarHeight,
    double? leadingWidth,
    TextStyle? toolbarTextStyle,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
    bool? forceMaterialTransparency,
    Clip? clipBehavior,
    int? maxLinesAndroid,
    void Function()? onBackPressed,
  }) {
    return PlatformSliverNavigationBar(
      leading: leading ?? this.leading,
      title: title ?? this.title,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      leadingColor: leadingColor ?? this.leadingColor,
      previousTitle: previousTitle ?? this.previousTitle,
      hasBackButton: hasBackButton ?? this.hasBackButton,
      brightness: brightness ?? this.brightness,
      actions: actions ?? this.actions,
      roundedBorder: roundedBorder ?? this.roundedBorder,
      inBottomSheet: inBottomSheet ?? this.inBottomSheet,
      noElevation: noElevation ?? this.noElevation,
      iOSHasBackDrop: iOSHasBackDrop ?? this.iOSHasBackDrop,
      border: border ?? this.border,
      actionsHasPadding: actionsHasPadding ?? this.actionsHasPadding,
      titleWidget: titleWidget ?? this.titleWidget,
      minFontSize: minFontSize ?? this.minFontSize,
      maxFontSize: maxFontSize ?? this.maxFontSize,
      flexibleSpace: flexibleSpace ?? this.flexibleSpace,
      bottom: bottom ?? this.bottom,
      elevation: elevation ?? this.elevation,
      scrolledUnderElevation:
          scrolledUnderElevation ?? this.scrolledUnderElevation,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      forceElevated: forceElevated ?? this.forceElevated,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      iconTheme: iconTheme ?? this.iconTheme,
      actionsIconTheme: actionsIconTheme ?? this.actionsIconTheme,
      primary: primary ?? this.primary,
      centerTitle: centerTitle ?? this.centerTitle,
      excludeHeaderSemantics:
          excludeHeaderSemantics ?? this.excludeHeaderSemantics,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      collapsedHeight: collapsedHeight ?? this.collapsedHeight,
      expandedHeight: expandedHeight ?? this.expandedHeight,
      floating: floating ?? this.floating,
      pinned: pinned ?? this.pinned,
      snap: snap ?? this.snap,
      stretch: stretch ?? this.stretch,
      stretchTriggerOffset: stretchTriggerOffset ?? this.stretchTriggerOffset,
      onStretchTrigger: onStretchTrigger ?? this.onStretchTrigger,
      shape: shape ?? this.shape,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      leadingWidth: leadingWidth ?? this.leadingWidth,
      toolbarTextStyle: toolbarTextStyle ?? this.toolbarTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      systemOverlayStyle: systemOverlayStyle ?? this.systemOverlayStyle,
      forceMaterialTransparency:
          forceMaterialTransparency ?? this.forceMaterialTransparency,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      maxLinesAndroid: maxLinesAndroid ?? this.maxLinesAndroid,
      onBackPressed: onBackPressed ?? this.onBackPressed,
    );
  }
}
