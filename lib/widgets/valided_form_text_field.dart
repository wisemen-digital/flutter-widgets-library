import 'package:conditional_wrap/conditional_wrap.dart';
import 'package:email_validator/email_validator.dart';
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

class ValidatedTextFormField extends ConsumerWidget {
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
    this.textCapitalization = TextCapitalization.none,
    this.isRequired = true,
    this.focusNode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.keyboardType,
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
    this.showAndroidLabel = false,
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
  final TextInputType? keyboardType;
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
  final bool showAndroidLabel;

  bool get showCupertinoLabel => isIos && label != null && !showAndroidLabel;

  TextStyle? _labelStyle(BuildContext context) =>
      labelStyle ?? Theme.of(context).inputDecorationTheme.labelStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordProvider = showPasswordProvider(key: key);
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
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            cursorColor: cursorColor,
            keyboardType: keyboardType,
            onFieldSubmitted: (text) => onFieldSubmitted?.call(text, ref),
            initialValue: initialValue,
            focusNode: focusNode,
            textCapitalization: textCapitalization,
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
            ),
            readOnly: readOnly,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            obscureText: isPassword ? !ref.watch(passwordProvider) : isPassword,
            scrollPadding: scrollPadding,
            style: style,
            autovalidateMode: autovalidateMode,
            onTapOutside: onTapOutside,
            validator: (value) {
              //* Value null check:
              if (value == null) {
                return Swl.of(context).fieldRequired;
              }

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
          if (isPassword && showObscureIcon)
            IconButton(
              hoverColor: Colors.transparent,
              icon: ref.watch(passwordProvider)
                  ? SvgPicture.asset(
                      hidePasswordIcon,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                      height: iconSize,
                      width: iconSize,
                    )
                  : SvgPicture.asset(
                      showPasswordIcon,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                      height: iconSize,
                      width: iconSize,
                    ),
              splashColor: Colors.transparent,
              onPressed: () =>
                  ref.read(passwordProvider.notifier).toggleValue(),
            ),
        ],
      ),
    );
  }
}
