import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class CustomImageCarousel extends HookConsumerWidget {
  const CustomImageCarousel({
    required this.controller,
    this.showPageIndicator = false,
    this.extraChildren = const [],
    this.photoViewBackgroundColor,
    this.showCloseButton = true,
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
    this.dismissThresholds,
    this.dismissDirection,
    this.imageProviders,
    this.initialPage,
    this.errorWidget,
    this.imageUrls,
    this.maxScale,
    this.heroTag,
    super.key,
  });

  final Map<DismissiblePageDismissDirection, double>? dismissThresholds;
  final List<ImageProvider<Object>>? imageProviders;
  final TextStyle pageIndicatorSeperatorTextstyle;
  final TextStyle totalAmountOfPagesTextstyle;
  final TextStyle currentPageTextstyle;
  final List<Widget> extraChildren;
  final PageController controller;
  final List<String>? imageUrls;
  final bool showPageIndicator;
  final bool showCloseButton;
  final Widget? errorWidget;
  final int? initialPage;

  /// Defaults to `DismissiblePageDismissDirection.multi`
  final DismissiblePageDismissDirection? dismissDirection;

  /// Defaults to `Colors.transparent`
  final Color? photoViewBackgroundColor;

  /// Defaults to `2.0`
  final double? maxScale;

  /// Defaults to `imageProviders[index].hashCode`
  final String? heroTag;

  static const double CLOSE_ICON_SIZE = 24;
  static const Color CLOSE_ICON_COLOR = Colors.white;
  static const Color CLOSE_ICON_BACKGROUND_COLOR = Colors.black;
  static const Duration CLOSE_ICON_ANIMATION_DURATION =
      Duration(milliseconds: 100);
  static const Offset CLOSE_ICON_SLIDE_OFFSET = Offset(0, -.5);
  static const double CLOSE_ICON_SIDE_PADDING = 24;

  static const Duration PAGE_INDICATOR_ANIMATION_DURATION =
      Duration(milliseconds: 100);
  static const Offset PAGE_INDICATOR_SLIDE_OFFSET = Offset(0, .5);
  static final BorderRadius PAGE_INDICATOR_BORDER_RADIUS =
      BorderRadius.circular(12);
  static const EdgeInsets PAGE_INDICATOR_PADDING =
      EdgeInsets.symmetric(horizontal: 6);
  static const Color PAGE_INDICATOR_BACKGROUND_COLOR = Colors.black;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> isDragging = useState(false);
    ValueNotifier<bool> isZoomed = useState(false);
    ValueNotifier<int> currentPage = useState(0);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.addListener(() {
          currentPage.value = controller.page!.round();
        });
      },
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          DismissiblePage(
            onDismissed: () => Navigator.of(context).pop(),
            onDragUpdate: (value) {
              if (value.overallDragValue > 0.0) {
                isDragging.value = true;
              } else {
                isDragging.value = false;
              }
            },
            direction:
                dismissDirection ?? DismissiblePageDismissDirection.multi,
            dismissThresholds: dismissThresholds ??
                {
                  DismissiblePageDismissDirection.multi: .2,
                },
            child: PageView.builder(
              controller: controller,
              itemCount: (imageProviders ?? imageUrls)!.length,
              itemBuilder: (context, index) => PhotoView(
                backgroundDecoration: BoxDecoration(
                  color: photoViewBackgroundColor ?? Colors.transparent,
                ),
                maxScale: PhotoViewComputedScale.covered * (maxScale ?? 2.0),
                heroAttributes: PhotoViewHeroAttributes(
                  tag:
                      heroTag ?? (imageProviders ?? imageUrls)![index].hashCode,
                ),
                errorBuilder: (context, error, stackTrace) => GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: errorWidget ??
                      const Center(
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            'Failed to load image',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                ),
                imageProvider: imageProviders?[index] ??
                    CachedNetworkImageProvider(
                      imageUrls![index],
                    ),
                scaleStateChangedCallback: (value) {
                  if (value == PhotoViewScaleState.initial ||
                      value == PhotoViewScaleState.zoomedOut) {
                    isZoomed.value = false;
                  }
                  if (value == PhotoViewScaleState.covering ||
                      value == PhotoViewScaleState.zoomedIn) {
                    isZoomed.value = true;
                  }
                },
              ),
            ),
          ),
          if (showCloseButton)
            PositionedDirectional(
              top: kToolbarHeight,
              end: CLOSE_ICON_SIDE_PADDING,
              child: AnimatedSlide(
                duration: CLOSE_ICON_ANIMATION_DURATION,
                offset: isDragging.value || isZoomed.value
                    ? CLOSE_ICON_SLIDE_OFFSET
                    : Offset.zero,
                child: AnimatedOpacity(
                  duration: CLOSE_ICON_ANIMATION_DURATION * 2,
                  opacity: isDragging.value || isZoomed.value ? 0.0 : 1.0,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.circular(CLOSE_ICON_SIZE / 2),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(CLOSE_ICON_SIZE / 2),
                          color: CLOSE_ICON_BACKGROUND_COLOR,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: CLOSE_ICON_SIZE,
                          color: CLOSE_ICON_COLOR,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (showPageIndicator)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                child: AnimatedSlide(
                  duration: PAGE_INDICATOR_ANIMATION_DURATION,
                  offset: isDragging.value || isZoomed.value
                      ? PAGE_INDICATOR_SLIDE_OFFSET
                      : Offset.zero,
                  child: AnimatedOpacity(
                    duration: PAGE_INDICATOR_ANIMATION_DURATION * 2,
                    opacity: isDragging.value || isZoomed.value ? 0.0 : 1.0,
                    child: Container(
                      padding: PAGE_INDICATOR_PADDING,
                      decoration: BoxDecoration(
                        borderRadius: PAGE_INDICATOR_BORDER_RADIUS,
                        color: PAGE_INDICATOR_BACKGROUND_COLOR,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${currentPage.value + 1}',
                            style: currentPageTextstyle,
                          ),
                          Text(
                            ' / ',
                            style: pageIndicatorSeperatorTextstyle,
                          ),
                          Text(
                            '${(imageProviders ?? imageUrls)!.length}',
                            style: totalAmountOfPagesTextstyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ...extraChildren,
        ],
      ),
    );
  }
}
