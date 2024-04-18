import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fullscreen_image_carousel.g.dart';

@riverpod
class Zoomed extends _$Zoomed {
  @override
  bool build() {
    return false;
  }

  // ignore: avoid_positional_boolean_parameters
  bool changeValue(bool val) => state = val;
}

class FullscreenImageCarousel extends StatefulWidget {
  // Basic constructor
  const FullscreenImageCarousel.basic({
    required this.imageProviders,
    required this.child,
    super.key,
    this.errorWidget,
    this.initialPage,
  }) : complexChild = null;

  // Complex constructor
  const FullscreenImageCarousel.complex({
    required this.imageProviders,
    required this.complexChild,
    super.key,
    this.errorWidget,
    this.initialPage,
  }) : child = null;
  final List<ImageProvider<Object>> imageProviders;
  final Widget? child;
  final Widget Function(void Function(int initalPage) openCarousel)?
      complexChild;
  final Widget? errorWidget;
  final int? initialPage;

  @override
  State<FullscreenImageCarousel> createState() =>
      _FullscreenImageCarouselWidgetState();
}

class _FullscreenImageCarouselWidgetState
    extends State<FullscreenImageCarousel> {
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialPage ?? 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void openCarousel({int initalPage = 0}) {
      controller = PageController(initialPage: initalPage);
      Navigator.push(
        context,
        PageRouteBuilder<dynamic>(
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          pageBuilder: (BuildContext context, _, __) => Scaffold(
            backgroundColor: Colors.black,
            body: Consumer(
              builder: (context, ref, child) {
                return PageView.builder(
                  controller: controller,
                  physics: ref.watch(zoomedProvider)
                      ? const NeverScrollableScrollPhysics()
                      : null,
                  itemCount: widget.imageProviders.length,
                  itemBuilder: (context, index) => PhotoView(
                    errorBuilder: (context, error, stackTrace) =>
                        GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: widget.errorWidget ??
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
                    imageProvider: widget.imageProviders[index],
                    onTapUp: (context, details, controllerValue) {
                      Navigator.pop(context);
                    },
                    scaleStateChangedCallback: (value) {
                      if (value == PhotoViewScaleState.initial ||
                          value == PhotoViewScaleState.zoomedOut) {
                        ref.read(zoomedProvider.notifier).changeValue(false);
                      }
                      if (value == PhotoViewScaleState.covering ||
                          value == PhotoViewScaleState.zoomedIn) {
                        ref.read(zoomedProvider.notifier).changeValue(true);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    if (widget.complexChild != null) {
      return widget.complexChild!((int initalPage) {
        openCarousel(initalPage: initalPage);
      });
    }

    return GestureDetector(
      onTap: openCarousel,
      child: widget.child ?? const SizedBox(),
    );
  }
}
