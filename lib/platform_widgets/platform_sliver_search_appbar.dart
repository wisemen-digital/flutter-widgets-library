import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisewidgetslibrary/s_core_localizations/s_core_localizations.dart';

import 'platform_widget.dart';

class PlatformSliverSearchAppBar
    extends PlatformWidget<CupertinoSliverNavigationBar, SliverAppBar> {
  const PlatformSliverSearchAppBar({
    required this.searchTextController,
    required this.onSearch,
    required this.focusNode,
    super.key,
    this.leading,
    this.title,
    this.backgroundColor,
    this.arrowColor,
    this.previousTitle,
    this.textStyle,
    this.hasBackButton = true,
    this.brightness,
    this.showBorder = false,
    this.animate = true,
    this.actions,
    this.roundedBorder = false,
    this.showSearch = false,
  });
  final Widget? leading;
  final String? title;
  final Color? backgroundColor;
  final Color? arrowColor;
  final String? previousTitle;
  final TextStyle? textStyle;
  final bool hasBackButton;
  final Brightness? brightness;
  final bool showBorder;
  final bool animate;
  final List<Widget>? actions;
  final bool roundedBorder;
  final bool showSearch;
  final TextEditingController searchTextController;
  final void Function() onSearch;
  final FocusNode focusNode;

  @override
  CupertinoSliverNavigationBar createCupertinoWidget(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return CupertinoSliverNavigationBar(
      backgroundColor: backgroundColor,
      previousPageTitle: previousTitle ?? Swl.of(context).back,
      brightness: brightness,
      leading: leading,
      largeTitle: Text(
        title ?? '',
        style: textStyle,
      ),
      middle: showSearch
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: showSearch ? maxWidth * .8 : 0,
              child: CupertinoTextField(
                controller: searchTextController,
                focusNode: focusNode,
                decoration: showSearch
                    ? BoxDecoration(
                        color: const CupertinoDynamicColor.withBrightness(
                          color: CupertinoColors.white,
                          darkColor: CupertinoColors.black,
                        ),
                        border: Border.all(
                          color: const CupertinoDynamicColor.withBrightness(
                            color: Color(0x33000000),
                            darkColor: Color(0x33FFFFFF),
                          ),
                          width: 0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      )
                    : null,
                placeholder: Swl.of(context).search,
                onSubmitted: (_) {
                  onSearch();
                },
                autofocus: true,
              ),
            )
          : null,
      trailing: actions != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions!,
            )
          : null,
      border: _createBorder(),
      transitionBetweenRoutes: animate,
    );
  }

  Border? _createBorder() {
    if (roundedBorder) {
      return const Border(left: BorderSide());
    }
    if (showBorder) {
      return const Border();
    } else {
      return null;
    }
  }

  @override
  SliverAppBar createMaterialWidget(BuildContext context) {
    const textStyle = TextStyle(fontWeight: FontWeight.bold);
    return SliverAppBar(
      backgroundColor: backgroundColor,
      titleTextStyle: textStyle,
      iconTheme: IconThemeData(color: arrowColor),
      leading: leading,
      elevation: showBorder ? null : 2.0,
      actions: actions,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
      ),
      expandedHeight: 100,
      shape: roundedBorder
          ? const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            )
          : null,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final settings = context
              .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
          final deltaExtent = settings.maxExtent - settings.minExtent;
          final scrollingRate = (1.0 -
                  (settings.currentExtent - settings.minExtent) / deltaExtent)
              .clamp(0.0, 1.0);
          return Padding(
            padding: EdgeInsets.only(
              bottom: (kToolbarHeight / 2) - 12,
              left: 20 + ((hasBackButton ? 40 : 0) * scrollingRate),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title ?? '',
                style:
                    textStyle.copyWith(fontSize: 35 - (scrollingRate * 17.5)),
              ),
            ),
          );
        },
      ),
    );
  }
}
