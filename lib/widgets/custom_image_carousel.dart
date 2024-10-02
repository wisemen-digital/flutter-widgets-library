import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class CustomImageCarousel extends ConsumerWidget {
  const CustomImageCarousel({
    required this.controller,
    this.photoViewBackgroundColor,
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
  final PageController controller;
  final List<String>? imageUrls;
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      direction: dismissDirection ?? DismissiblePageDismissDirection.multi,
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
            tag: heroTag ?? (imageProviders ?? imageUrls)![index].hashCode,
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
        ),
      ),
    );
  }
}
