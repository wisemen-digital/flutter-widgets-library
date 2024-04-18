import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_indicator.dart';

import 'platform_widget.dart';

class PlatformAnimatedButton extends PlatformWidget<Widget, Widget> {
  const PlatformAnimatedButton({
    super.key,
    this.child,
    this.textStyle = const TextStyle(color: Colors.black),
    this.onPressed,
    this.disabled = false,
    this.isLoading = false,
    this.borderRadiusValue = 8,
    this.color = Colors.white,
    this.border,
    this.maxLines,
    this.loadingIndicatorColor,
    this.expand = true,
    this.padding = const EdgeInsets.all(15),
    this.disabledColor,
    this.duration,
  });

  final Widget? child;
  final TextStyle textStyle;
  final void Function()? onPressed;
  final bool disabled;
  final bool isLoading;
  final double borderRadiusValue;
  final Color color;
  final BoxBorder? border;
  final int? maxLines;
  final Color? loadingIndicatorColor;
  final bool expand;
  final EdgeInsetsGeometry padding;
  final Color? disabledColor;
  final Duration? duration;

  @override
  Widget createCupertinoWidget(BuildContext context) {
    var busy = false;
    return SizedBox(
      width: expand ? double.infinity : null,
      child: AnimatedContainer(
        duration: duration ?? const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.circular(borderRadiusValue),
        ),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(borderRadiusValue - 1),
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
          color: Colors.transparent,
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
                  child: child,
                ),
        ),
      ),
    );
  }

  @override
  Widget createMaterialWidget(BuildContext context) {
    var busy = false;
    return SizedBox(
      width: expand ? double.infinity : null,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: duration ?? const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              border: border,
              color: disabled || isLoading
                  ? disabledColor ?? color.withOpacity(.4)
                  : color,
              borderRadius: BorderRadius.circular(borderRadiusValue),
            ),
            child: isLoading
                ? Padding(
                    padding: padding,
                    child: Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: loadingIndicatorColor ?? textStyle.color,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: padding,
                    child: Center(
                      child: child,
                    ),
                  ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(borderRadiusValue),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlatformAnimatedButtonInstance extends PlatformAnimatedButton {
  const PlatformAnimatedButtonInstance({
    super.key,
    super.child,
    super.onPressed,
    super.disabled = false,
    super.isLoading = false,
    super.borderRadiusValue,
    super.border,
    super.maxLines,
    super.loadingIndicatorColor,
    super.expand,
    super.padding,
  });
}
