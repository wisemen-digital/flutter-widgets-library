import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class PlatformWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return createMaterialWidget(context);
    }
    if (Platform.isAndroid || Platform.isFuchsia || Platform.isWindows) {
      return createMaterialWidget(context);
    } else if (Platform.isIOS || Platform.isMacOS || Platform.isLinux) {
      return createCupertinoWidget(context);
    }

    // Platform not supported returns an empty widget
    return const SizedBox.shrink();
  }

  I createCupertinoWidget(BuildContext context);

  A createMaterialWidget(BuildContext context);
}
