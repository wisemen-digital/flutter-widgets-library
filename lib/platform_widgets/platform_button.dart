import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_indicator.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_widget.dart';

class PlatformButton extends PlatformWidget<Widget, Widget> {
  PlatformButton({
    super.key,
    this.text,
    this.child,
    this.textStyle = const TextStyle(color: Colors.black),
    this.onPressed,
    this.disabled = false,
    this.isLoading = false,
    this.borderRadius,
    this.cupertinoBorderRadius,
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
  }) {
    if (text == null && child == null) {
      throw ArgumentError('Either the param text or content is required');
    } else if (text != null && child != null) {
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
  final BorderRadius? cupertinoBorderRadius;
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

  @override
  Widget createCupertinoWidget(BuildContext context) {
    var busy = false;
    return Container(
      height: height,
      width: expand ? double.infinity : width,
      margin: margin,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusValue),
        boxShadow: boxShadow,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        borderRadius: cupertinoBorderRadius ??
            borderRadius ??
            BorderRadius.circular(borderRadiusValue),
        onPressed: !disabled && !isLoading
            ? () async {
                if (busy == false) {
                  if (onPressed != null) {
                    onPressed!();
                    busy = true;
                  }
                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      busy = false;
                    },
                  );
                }
              }
            : null,
        color: color,
        minSize: 0,
        disabledColor: disabledColor ?? color.withOpacity(.4),
        pressedOpacity: .8,
        child: isLoading
            ? Padding(
                padding: padding,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: PlatformLoadingIndicator(
                    color: loadingIndicatorColor ?? textStyle.color,
                  ),
                ),
              )
            : Padding(
                padding: padding,
                child: text != null
                    ? maxLines == null
                        ? Text(
                            text!,
                            style: textStyle,
                            textAlign: TextAlign.center,
                          )
                        : AutoSizeText(
                            text!,
                            style: textStyle,
                            textAlign: TextAlign.center,
                            maxLines: maxLines,
                          )
                    : child,
              ),
      ),
    );
  }

  @override
  Widget createMaterialWidget(BuildContext context) {
    var busy = false;
    return Container(
      height: height,
      width: expand ? double.infinity : width,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius:
              borderRadius ?? BorderRadius.circular(borderRadiusValue),
          onTap: !disabled && !isLoading
              ? () async {
                  if (busy == false) {
                    if (onPressed != null) {
                      onPressed!();
                      busy = true;
                    }
                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        busy = false;
                      },
                    );
                  }
                }
              : null,
          child: Ink(
            decoration: BoxDecoration(
              border: border,
              color: disabled || isLoading
                  ? disabledColor ?? color.withOpacity(.4)
                  : color,
              borderRadius: borderRadius,
            ),
            child: isLoading
                ? Padding(
                    padding: padding,
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                        child: PlatformLoadingIndicator(
                          color: loadingIndicatorColor ?? textStyle.color,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: padding,
                    child: text != null
                        ? maxLines == null
                            ? Text(
                                text!,
                                style: textStyle,
                                textAlign: TextAlign.center,
                              )
                            : AutoSizeText(
                                text!,
                                style: textStyle,
                                textAlign: TextAlign.center,
                                maxLines: maxLines,
                              )
                        : child,
                  ),
          ),
        ),
      ),
    );
  }
}

class PlatformButtonInstance extends PlatformButton {
  PlatformButtonInstance({
    super.key,
    super.text,
    super.child,
    super.onPressed,
    super.disabled = false,
    super.isLoading = false,
    super.borderRadius,
    super.border,
    super.maxLines,
    super.loadingIndicatorColor,
    super.expand,
    super.padding,
  });
}
