import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_sliver_navigation.dart';
import 'package:wisewidgetslibrary/widgets/measure_size.dart';

class SnapScrollView extends StatefulWidget {
  const SnapScrollView({
    required this.platformSliverNavigationBar,
    required this.columnBody,
    required this.statusBarHeight,
    super.key,
    this.maxHeight = 100,
    this.minHeight = kToolbarHeight,
    this.columnHeader,
    this.physics,
    this.hasSafeArea = true,
    this.hasBottombar = true,
    this.paddingBody = const EdgeInsets.symmetric(horizontal: 16),
    this.paddingHeader = EdgeInsets.zero,
    this.backgroundBody,
  });
  final double maxHeight;
  final double minHeight;
  final double statusBarHeight;
  final bool hasSafeArea;
  final bool hasBottombar;
  final PlatformSliverNavigationBar platformSliverNavigationBar;
  final List<Widget> columnBody;
  final List<Widget>? columnHeader;
  final ScrollPhysics? physics;
  final EdgeInsets paddingHeader;
  final EdgeInsets paddingBody;
  final Color? backgroundBody;

  @override
  State<SnapScrollView> createState() => _SnapScrollViewState();
}

class _SnapScrollViewState extends State<SnapScrollView> {
  final ScrollController _controller = ScrollController();
  double scrollDistance = 0;

  double scrollHeight = 0;
  double listHeight = 0;

  double headerHeight = 0;
  double bodyHeight = 0;
  double extraHeight = 0;

  @override
  void initState() {
    scrollDistance = widget.maxHeight - widget.minHeight;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafe = widget.hasSafeArea
        ? (View.of(context).viewPadding.bottom != 0 ? 34 : 0)
        : 0;
    final screenHeight = MediaQuery.of(context).size.height -
        widget.statusBarHeight -
        (widget.hasBottombar ? kBottomNavigationBarHeight : 0) -
        bottomSafe -
        kToolbarHeight;
    final listHeight =
        bodyHeight + (widget.columnHeader != null ? headerHeight : 0);

    if (screenHeight < listHeight) {
      extraHeight = 0;
    } else if ((screenHeight - listHeight) <= scrollDistance) {
      extraHeight = screenHeight - listHeight;
    } else {
      extraHeight = 0;
    }

    void snapFunction({required double offset}) {
      if (offset > 0 && offset < scrollDistance) {
        final snapOffset = offset / scrollDistance > 0.5 ? scrollDistance : 0.0;
        Future.microtask(
          () => _controller.animateTo(
            snapOffset,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          ),
        );
      }
    }

    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollNotification) {
        final offset = scrollNotification.metrics.pixels;
        snapFunction(offset: offset);
        return false;
      },
      child: CustomScrollView(
        physics: widget.physics ??
            (Platform.isIOS
                ? const BouncingScrollPhysics()
                : const ClampingScrollPhysics()),
        controller: _controller,
        slivers: [
          widget.platformSliverNavigationBar.copyWith(
            stretch: true,
            pinned: true,
            expandedHeight: widget.maxHeight,
          ),
          if (widget.columnHeader != null)
            SliverPinnedHeader(
              child: Container(
                color: widget.platformSliverNavigationBar.backgroundColor,
                child: MeasureSize(
                  onChange: (size) {
                    headerHeight = size.height;
                    setState(() {});
                  },
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: widget.paddingHeader,
                    children: widget.columnHeader!,
                  ),
                ),
              ),
            ),
          SliverClip(
            child: SliverToBoxAdapter(
              child: Container(
                color: widget.backgroundBody,
                child: MeasureSize(
                  onChange: (size) {
                    bodyHeight = size.height;
                    setState(() {});
                  },
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: widget.paddingBody,
                    children: widget.columnBody,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: extraHeight)),
        ],
      ),
    );
  }
}
