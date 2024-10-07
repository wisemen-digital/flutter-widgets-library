// ignore_for_file: inference_failure_on_function_invocation

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wisewidgetslibrary/widgets/custom_image_carousel.dart';

class FullscreenImageCarousel extends ConsumerStatefulWidget {
  // Basic constructor
  const FullscreenImageCarousel.basic({
    required this.imageProviders,
    required this.child,
    super.key,
    this.errorWidget,
    this.initialPage,
    this.heroTag,
    this.maxScale,
    this.photoViewBackgroundColor,
    this.showPageIndicator = true,
    this.showCloseButton = true,
    this.enableRotation = false,
    this.extraChildren = const [],
    this.currentPageTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.pageIndicatorSeperatorTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.totalAmountOfPagesTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.dismissTresholds,
    this.dismissDirection,
  })  : complexChild = null,
        imageUrls = null;

  // Complex constructor
  const FullscreenImageCarousel.complex({
    required this.imageProviders,
    required this.complexChild,
    super.key,
    this.errorWidget,
    this.initialPage,
    this.heroTag,
    this.maxScale,
    this.photoViewBackgroundColor,
    this.showPageIndicator = true,
    this.showCloseButton = true,
    this.enableRotation = false,
    this.extraChildren = const [],
    this.currentPageTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.pageIndicatorSeperatorTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.totalAmountOfPagesTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.dismissTresholds,
    this.dismissDirection,
  })  : child = null,
        imageUrls = null;

  // Basic constructor with urls
  const FullscreenImageCarousel.basicWithUrls({
    required this.imageUrls,
    required this.child,
    super.key,
    this.errorWidget,
    this.initialPage,
    this.heroTag,
    this.maxScale,
    this.photoViewBackgroundColor,
    this.showPageIndicator = true,
    this.showCloseButton = true,
    this.enableRotation = false,
    this.extraChildren = const [],
    this.currentPageTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.pageIndicatorSeperatorTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.totalAmountOfPagesTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.dismissTresholds,
    this.dismissDirection,
  })  : complexChild = null,
        imageProviders = null;

  // Complex constructor with urls
  const FullscreenImageCarousel.complexWithUrls({
    required this.imageUrls,
    required this.complexChild,
    super.key,
    this.errorWidget,
    this.initialPage,
    this.heroTag,
    this.maxScale,
    this.photoViewBackgroundColor,
    this.showPageIndicator = true,
    this.showCloseButton = true,
    this.enableRotation = false,
    this.extraChildren = const [],
    this.currentPageTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.pageIndicatorSeperatorTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.totalAmountOfPagesTextstyle = const TextStyle(
      fontFamily: 'CupertinoSystemDisplay',
      fontWeight: FontWeight.w600,
      color: Colors.grey,
      fontSize: 16,
    ),
    this.dismissTresholds,
    this.dismissDirection,
  })  : child = null,
        imageProviders = null;

  final List<ImageProvider<Object>>? imageProviders;
  final List<String>? imageUrls;
  final Widget? child;
  final Widget Function(void Function(int initialPage) openCarousel)?
      complexChild;
  final Widget? errorWidget;
  final int? initialPage;
  final String? heroTag;
  final double? maxScale;
  final Color? photoViewBackgroundColor;
  final Map<DismissiblePageDismissDirection, double>? dismissTresholds;
  final DismissiblePageDismissDirection? dismissDirection;
  final bool showPageIndicator;
  final bool showCloseButton;
  final List<Widget> extraChildren;
  final TextStyle currentPageTextstyle;
  final bool enableRotation;
  final TextStyle pageIndicatorSeperatorTextstyle;
  final TextStyle totalAmountOfPagesTextstyle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FullscreenImageCarouselState();
}

class _FullscreenImageCarouselState
    extends ConsumerState<FullscreenImageCarousel> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialPage ?? 0);
    currentPage = widget.initialPage ?? 0;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void openCarousel({
      int initialPage = 0,
    }) {
      controller = PageController(initialPage: initialPage);
      context.pushTransparentRoute(
        CustomImageCarousel(
          photoViewBackgroundColor: widget.photoViewBackgroundColor,
          dismissThresholds: widget.dismissTresholds,
          dismissDirection: widget.dismissDirection,
          imageProviders: widget.imageProviders,
          extraChildren: widget.extraChildren,
          showPageIndicator: widget.showPageIndicator,
          showCloseButton: widget.showCloseButton,
          enableRotation: widget.enableRotation,
          currentPageTextstyle: widget.currentPageTextstyle,
          pageIndicatorSeperatorTextstyle:
              widget.pageIndicatorSeperatorTextstyle,
          totalAmountOfPagesTextstyle: widget.totalAmountOfPagesTextstyle,
          errorWidget: widget.errorWidget,
          imageUrls: widget.imageUrls,
          maxScale: widget.maxScale,
          initialPage: initialPage,
          heroTag: widget.heroTag,
          controller: controller,
        ),
      );
    }

    if (widget.complexChild != null) {
      return widget.complexChild!((int initialPage) {
        openCarousel(initialPage: initialPage);
      });
    }

    return GestureDetector(
      onTap: () => openCarousel(initialPage: widget.initialPage ?? 0),
      child: widget.child ?? const SizedBox(),
    );
  }
}
