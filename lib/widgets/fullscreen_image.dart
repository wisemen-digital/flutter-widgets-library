import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullscreenImage extends StatelessWidget {
  FullscreenImage.asset({
    required this.imageAsset,
    required this.child,
    super.key,
    this.errorWidget,
  })  : imageUrl = null,
        imagePath = null;

  FullscreenImage.network({
    required this.imageUrl,
    required this.child,
    super.key,
    this.errorWidget,
  })  : imagePath = null,
        imageAsset = null;

  FullscreenImage.file({
    required this.imagePath,
    required this.child,
    super.key,
    this.errorWidget,
  })  : imageUrl = null,
        imageAsset = null;
  final String? imageUrl;
  final String? imagePath;
  final String? imageAsset;
  final Widget child;
  final Widget? errorWidget;
  final Key heroKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: heroKey,
        child: child,
      ),
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder<dynamic>(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              opacity: animation,
              child: child,
            ),
            pageBuilder: (BuildContext context, _, __) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: Hero(
                  tag: heroKey,
                  child: PhotoView(
                    errorBuilder: (context, error, stackTrace) =>
                        GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                    imageProvider: imageUrl != null
                        ? CachedNetworkImageProvider(imageUrl!)
                        : imagePath != null
                            ? Image.file(File(imagePath!)).image
                            : Image.asset(imageAsset!).image,
                    onTapUp: (context, details, controllerValue) {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
