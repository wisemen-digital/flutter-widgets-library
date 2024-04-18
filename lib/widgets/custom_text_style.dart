import 'dart:io';

import 'package:flutter/material.dart';

class CustomTextStyle extends TextStyle {
  CustomTextStyle({
    super.inherit,
    super.color,
    super.backgroundColor,
    super.fontSize,
    FontWeight? fontWeight,
    List<FontVariation>? fontVariations,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    String? fontFamily,
    String? iosFontFamily,
    String? androidFontFamily,
    super.fontFamilyFallback,
    super.package,
    super.overflow,
  }) : super(
          fontFamily: fontFamily ??
              (Platform.isIOS ? iosFontFamily : androidFontFamily),
          fontWeight: fontFamily != null ||
                  Platform.isIOS ||
                  Platform.isAndroid && androidFontFamily != null
              ? fontWeight
              : null,
          fontVariations: Platform.isIOS
              ? null
              : fontVariations ??
                  (fontWeight != null
                      ? <FontVariation>[
                          FontVariation('wght', fontWeight.value.toDouble()),
                        ]
                      : null),
        );
}
