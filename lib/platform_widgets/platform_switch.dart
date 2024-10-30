import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformSwitch extends PlatformWidget<CupertinoSwitch, Switch> {
  const PlatformSwitch({
    required this.value,
    required this.onChanged,
    super.key,
    this.activeColor,
    this.inactiveColor,
  });
  final bool value;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool) onChanged;
  final Color? activeColor;

  /// Border and track color on Android when the switch is off.
  final Color? inactiveColor;

  @override
  CupertinoSwitch createCupertinoWidget(BuildContext context) =>
      CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
      );

  @override
  Switch createMaterialWidget(BuildContext context) => Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
        inactiveThumbColor: inactiveColor,
        trackOutlineColor: value
            ? null
            : WidgetStatePropertyAll(
                inactiveColor,
              ),
      );
}
