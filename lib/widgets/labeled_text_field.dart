// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:conditional_wrap/conditional_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:wisewidgetslibrary/wise_widgets_library.dart';

class LabeledTextField extends ConsumerWidget {
  const LabeledTextField({
    this.textInputAction,
    this.disabled = false,
    this.textCapitalization,
    this.isRequired = true,
    this.scrollPadding = const EdgeInsets.all(20),
    this.readOnly = false,
    this.showAndroidLabel = false,
    super.key,
    this.controller,
    this.decoration = const InputDecoration(),
    this.onChanged,
    this.style,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.label,
    this.labelStyle,
    this.cursorColor,
    this.onFieldSubmitted,
    this.onEditingComplete,
  });

  final TextEditingController? controller;
  final InputDecoration decoration;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final bool disabled;
  final TextCapitalization? textCapitalization;
  final bool isRequired;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final EdgeInsets scrollPadding;
  final bool readOnly;
  final String? label;
  final TextStyle? labelStyle;
  final bool showAndroidLabel;
  final Color? cursorColor;
  final FutureOr<void> Function(String text, WidgetRef ref)? onFieldSubmitted;
  final FutureOr<void> Function()? onEditingComplete;

  bool get showCupertinoLabel => isIos && label != null && !showAndroidLabel;

  TextStyle? _labelStyle(BuildContext context) =>
      labelStyle ?? Theme.of(context).inputDecorationTheme.labelStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetWrapper(
      wrapper: (child) {
        if (showCupertinoLabel) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label!,
                style: _labelStyle(context),
              ),
              gapH5,
              child,
            ],
          );
        } else {
          return child;
        }
      },
      child: TextField(
        controller: controller,
        cursorColor: cursorColor,
        keyboardType: keyboardType,
        onSubmitted: (text) => onFieldSubmitted?.call(text, ref),
        focusNode: focusNode,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        enabled: !disabled,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        decoration: decoration.copyWith(
          label: showAndroidLabel && label != null ? Text(label!) : null,
          labelStyle: _labelStyle(
            context,
          ),
          floatingLabelStyle: _labelStyle(
            context,
          ),
        ),
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        scrollPadding: scrollPadding,
        style: style,
      ),
    );
  }
}
