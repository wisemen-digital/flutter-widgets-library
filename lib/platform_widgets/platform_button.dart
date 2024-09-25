import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/constants/constants.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_widgets.dart';

class PlatformButton extends StatelessWidget {
  PlatformButton({
    super.key,
    this.text,
    this.child,
    this.textStyle = const TextStyle(color: Colors.black),
    this.onPressed,
    this.disabled = false,
    this.isLoading = false,
    this.borderRadius,
    this.borderRadiusValue = 8,
    this.color = Colors.white,
    this.border,
    this.maxLines,
    this.loadingIndicatorColor,
    this.expand = true,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.disabledColor,
    this.boxShadow,
    this.height,
    this.width,
    this.textAlign = TextAlign.center,
    this.duration = const Duration(milliseconds: 300),
    this.gradient,
  }) {
    if (text != null && child != null) {
      throw ArgumentError(
        'Either the param text or content can be passed at a time.',
      );
    }
  }

  final String? text;
  final Widget? child;
  final TextStyle textStyle;
  final void Function()? onPressed;
  final bool disabled;
  final bool isLoading;
  final BorderRadius? borderRadius;
  final Color color;
  final BoxBorder? border;
  final int? maxLines;
  final Color? loadingIndicatorColor;
  final bool expand;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color? disabledColor;
  final double borderRadiusValue;
  final List<BoxShadow>? boxShadow;
  final TextAlign textAlign;
  final Duration duration;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashFactory: isIos ? NoSplash.splashFactory : null,
          onTap: !disabled && !isLoading ? onPressed : null,
          borderRadius:
              borderRadius ?? BorderRadius.circular(borderRadiusValue),
          child: Ink(
            height: height,
            padding: padding,
            width: expand ? double.infinity : width,
            decoration: BoxDecoration(
              border: border,
              gradient: gradient,
              color: !disabled && !isLoading && onPressed != null
                  ? color
                  : (disabledColor ?? color.withOpacity(.4)),
              borderRadius:
                  borderRadius ?? BorderRadius.circular(borderRadiusValue),
              boxShadow: boxShadow,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  opacity: isLoading ? 0 : 1,
                  child: child ??
                      Text(
                        text ?? '',
                        style: textStyle,
                        maxLines: maxLines,
                        textAlign: textAlign,
                      ),
                ),
                AnimatedOpacity(
                  opacity: isLoading ? 1 : 0,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: PlatformLoadingIndicator(
                    color: loadingIndicatorColor ?? textStyle.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
