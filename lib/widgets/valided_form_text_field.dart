import 'dart:ui';

import 'package:conditional_wrap/conditional_wrap.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wisewidgetslibrary/wise_widgets_library.dart';

part 'valided_form_text_field.g.dart';

@riverpod
class ShowPassword extends _$ShowPassword {
  @override
  bool build({Key? key}) {
    return false;
  }

  void toggleValue() => state = !state;
}

class ValidatedTextFormField extends HookConsumerWidget {
  const ValidatedTextFormField({
    super.key,
    this.decoration = const InputDecoration(),
    this.isEmail = false,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.passwordIsShown,
    this.passwordValidation,
    this.customValidation,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.onChanged,
    this.disabled = false,
    this.initialValue,
    this.textCapitalization = TextCapitalization.sentences,
    this.isRequired = true,
    this.focusNode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.showPasswordIcon = Assets.eyeOn,
    this.hidePasswordIcon = Assets.eyeOff,
    this.showObscureIcon = true,
    this.hideErrorText = false,
    this.minimumPasswordLength = 8,
    this.iconColor = Colors.black,
    this.scrollPadding = const EdgeInsets.all(20),
    this.style,
    this.readOnly = false,
    this.autovalidateMode,
    this.onTapOutside,
    this.cursorColor,
    this.iconSize = 19,
    this.label,
    this.labelStyle,
    this.forceAndroidLabel = false,
    this.minLines,
    this.maxLines = 1,
    this.withAutoCorrect = true,
    this.autofillHints,
    this.autofocus = false,
    this.buildCounter,
    this.canRequestFocus = true,
    this.clipBehavior = Clip.hardEdge,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.cursorErrorColor,
    this.cursorHeight,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorOpacityAnimates,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableIMEPersonalizedLearning = true,
    this.enableInteractiveSelection,
    this.enableSuggestions = true,
    this.expands = false,
    this.ignorePointers,
    this.keyboardAppearance,
    this.magnifierConfiguration,
    this.maxLength,
    this.maxLengthEnforcement,
    this.mouseCursor,
    this.obscuringCharacter = '•',
    this.onAppPrivateCommand,
    this.onSaved,
    this.onTap,
    this.onTapAlwaysCalled = false,
    this.restorationId,
    this.scribbleEnabled = true,
    this.scrollController,
    this.scrollPhysics,
    this.selectionControls,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.statesController,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.undoController,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final InputDecoration decoration;
  final bool isEmail;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool? passwordIsShown;
  final String? Function(String?)? passwordValidation;
  final String? Function(String?)? customValidation;
  final TextInputAction textInputAction;
  final bool disabled;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final bool isRequired;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final FutureOr<void> Function(String text, WidgetRef ref)? onFieldSubmitted;
  final FutureOr<void> Function()? onEditingComplete;
  final String showPasswordIcon;
  final String hidePasswordIcon;
  final bool showObscureIcon;
  final bool hideErrorText;
  final int minimumPasswordLength;
  final Color iconColor;
  final EdgeInsets scrollPadding;
  final TextStyle? style;
  final bool readOnly;
  final AutovalidateMode? autovalidateMode;
  final void Function(PointerDownEvent)? onTapOutside;
  final Color? cursorColor;
  final double iconSize;
  final String? label;
  final TextStyle? labelStyle;
  final bool forceAndroidLabel;
  final int? minLines;
  final int? maxLines;
  final bool withAutoCorrect;
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final Widget? Function(
    BuildContext, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  })? buildCounter;
  final bool canRequestFocus;
  final Clip clipBehavior;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final Color? cursorErrorColor;
  final double? cursorHeight;
  final double cursorWidth;
  final Radius? cursorRadius;
  final bool? cursorOpacityAnimates;
  final DragStartBehavior dragStartBehavior;
  final bool enableIMEPersonalizedLearning;
  final bool? enableInteractiveSelection;
  final bool enableSuggestions;
  final bool expands;
  final bool? ignorePointers;
  final Brightness? keyboardAppearance;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final MouseCursor? mouseCursor;
  final String obscuringCharacter;
  final void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final bool onTapAlwaysCalled;
  final String? restorationId;
  final bool scribbleEnabled;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final TextSelectionControls? selectionControls;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final bool? showCursor;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final WidgetStatesController? statesController;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final UndoHistoryController? undoController;

  bool get showCupertinoLabel => isIos && label != null && !showAndroidLabel;

  bool get showAndroidLabel =>
      (isAndroid && label != null && !showCupertinoLabel) || forceAndroidLabel;

  TextStyle? _labelStyle(BuildContext context) =>
      labelStyle ?? Theme.of(context).inputDecorationTheme.labelStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordProvider = showPasswordProvider(key: key);

    void togglePassword() {
      ref.read(passwordProvider.notifier).toggleValue();
    }

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
      child: TextFormField(
        cursorHeight: cursorHeight,
        cursorWidth: cursorWidth,
        cursorRadius: cursorRadius,
        cursorOpacityAnimates: cursorOpacityAnimates,
        dragStartBehavior: dragStartBehavior,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
        enableInteractiveSelection: enableInteractiveSelection,
        enableSuggestions: enableSuggestions,
        expands: expands,
        ignorePointers: ignorePointers,
        keyboardAppearance: keyboardAppearance,
        magnifierConfiguration: magnifierConfiguration,
        maxLength: maxLength,
        maxLengthEnforcement: maxLengthEnforcement,
        mouseCursor: mouseCursor,
        obscuringCharacter: obscuringCharacter,
        onAppPrivateCommand: onAppPrivateCommand,
        onSaved: onSaved,
        onTap: onTap,
        onTapAlwaysCalled: onTapAlwaysCalled,
        restorationId: restorationId,
        scribbleEnabled: scribbleEnabled,
        scrollController: scrollController,
        scrollPhysics: scrollPhysics,
        selectionControls: selectionControls,
        selectionHeightStyle: selectionHeightStyle,
        selectionWidthStyle: selectionWidthStyle,
        showCursor: showCursor,
        smartDashesType: smartDashesType,
        smartQuotesType: smartQuotesType,
        spellCheckConfiguration: spellCheckConfiguration,
        statesController: statesController,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textAlignVertical: textAlignVertical,
        textDirection: textDirection,
        undoController: undoController,
        cursorErrorColor: cursorErrorColor,
        contextMenuBuilder: contextMenuBuilder,
        contentInsertionConfiguration: contentInsertionConfiguration,
        clipBehavior: clipBehavior,
        canRequestFocus: canRequestFocus,
        buildCounter: buildCounter,
        autofillHints: autofillHints,
        autofocus: autofocus,
        autocorrect: withAutoCorrect,
        cursorColor: cursorColor,
        keyboardType: _getKeyboardType(),
        textCapitalization: _getTextCapitalization(),
        textInputAction: textInputAction,
        onFieldSubmitted: (text) => onFieldSubmitted?.call(text, ref),
        initialValue: initialValue,
        focusNode: focusNode,
        enabled: !disabled,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        controller: controller,
        decoration: decoration.copyWith(
          errorStyle: hideErrorText ? const TextStyle(height: 0) : null,
          label: showAndroidLabel && label != null ? Text(label!) : null,
          labelStyle: _labelStyle(
            context,
          ),
          floatingLabelStyle: _labelStyle(
            context,
          ),
          suffixIcon: !isPassword
              ? null
              : IconButton(
                  hoverColor: Colors.transparent,
                  icon: ref.watch(passwordProvider)
                      ? SvgPicture.asset(
                          hidePasswordIcon,
                          colorFilter:
                              ColorFilter.mode(iconColor, BlendMode.srcIn),
                          height: iconSize,
                          width: iconSize,
                        )
                      : SvgPicture.asset(
                          showPasswordIcon,
                          colorFilter:
                              ColorFilter.mode(iconColor, BlendMode.srcIn),
                          height: iconSize,
                          width: iconSize,
                        ),
                  splashColor: Colors.transparent,
                  onPressed: togglePassword,
                ),
        ),
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        obscureText: isPassword ? !ref.watch(passwordProvider) : isPassword,
        scrollPadding: scrollPadding,
        style: style,
        autovalidateMode: autovalidateMode,
        onTapOutside: onTapOutside,
        minLines: minLines,
        maxLines: maxLines,
        validator: (value) {
          //* Value null check:
          if (value == null) {
            return Swl.of(context).fieldRequired;
          }

          value = value.trim();

          //* If non-required value is empty
          if (!isRequired && value.isEmpty) {
            return null;
          }

          //* Empty validation check:
          if (value.isEmpty) {
            return Swl.of(context).fieldRequired;
          }

          //* Email validation:
          if (isEmail) {
            if (!EmailValidator.validate(value)) {
              return Swl.of(context).emailValidation;
            }
          }
          //* Phone number validation:
          if (isPhoneNumber) {
            if (!RegExp(
              r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$',
            ).hasMatch(value)) {
              return Swl.of(context).phoneNumberIsInvalid;
            }
          }
          //* Password validation:
          if (isPassword && (passwordValidation == null)) {
            if (value.length < minimumPasswordLength) {
              return Swl.of(context).passwordIsTooShort;
            }
          } else if (isPassword && (passwordValidation != null)) {
            return passwordValidation!(value);
          }
          //* Custom validation
          if (customValidation != null) {
            return customValidation!(value);
          }
          return null;
        },
      ),
    );
  }

  TextInputType? _getKeyboardType() {
    if (isEmail) {
      return TextInputType.emailAddress;
    } else if (isPhoneNumber) {
      return TextInputType.phone;
    } else {
      return keyboardType;
    }
  }

  TextCapitalization _getTextCapitalization() {
    if (isEmail || isPassword) {
      return TextCapitalization.none;
    } else {
      return textCapitalization;
    }
  }

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }
}
