import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wisewidgetslibrary/platform_widgets/platform_indicator.dart';

class PlatformButton extends StatelessWidget {
  const PlatformButton.text({
    required this.text,
    super.key,
    this.textStyle = const TextStyle(color: Colors.black),
    this.onPressed,
    this.disabled = false,
    this.isLoading = false,
    this.borderRadius,
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
    this.leadingWidget,
    this.trailingWidget,
  }) : child = null;

  const PlatformButton.child({
    required this.child,
    super.key,
    this.textStyle = const TextStyle(color: Colors.black),
    this.onPressed,
    this.disabled = false,
    this.isLoading = false,
    this.borderRadius,
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
    this.leadingWidget,
    this.trailingWidget,
  }) : text = null;

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
  final List<BoxShadow>? boxShadow;
  final Widget? leadingWidget;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    var busy = false;
    return Container(
      height: height,
      width: expand ? double.infinity : width,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: border,
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          onTap: !disabled && !isLoading
              ? () async {
                  if (!busy) {
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
              borderRadius: borderRadius,
              color: disabled || isLoading
                  ? disabledColor ?? color.withOpacity(.4)
                  : color,
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
                : Row(
                    children: [
                      if (leadingWidget != null) leadingWidget!,
                      if (expand)
                        Expanded(child: _buildChild())
                      else
                        _buildChild(),
                      if (trailingWidget != null) trailingWidget!,
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildChild() {
    return Center(
      child: Padding(
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
    );
  }
}

class PlatformButtonInstance extends PlatformButton {
  const PlatformButtonInstance.text({
    required String super.text,
    super.key,
    super.textStyle,
    super.onPressed,
    super.disabled,
    super.isLoading,
    super.borderRadius,
    super.color,
    super.border,
    super.maxLines,
    super.loadingIndicatorColor,
    super.expand,
    EdgeInsets super.margin,
    EdgeInsets super.padding,
    super.disabledColor,
    super.boxShadow,
    super.height,
    super.width,
    super.leadingWidget,
    super.trailingWidget,
  }) : super.text();

  const PlatformButtonInstance.child({
    required Widget super.child,
    super.key,
    super.textStyle,
    super.onPressed,
    super.disabled,
    super.isLoading,
    super.borderRadius,
    super.color,
    super.border,
    super.maxLines,
    super.loadingIndicatorColor,
    super.expand,
    EdgeInsets super.margin,
    EdgeInsets super.padding,
    super.disabledColor,
    super.boxShadow,
    super.height,
    super.width,
    super.leadingWidget,
    super.trailingWidget,
  }) : super.child();
}
