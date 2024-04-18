import 'dart:io';

import 'package:flutter/foundation.dart';

bool get isWeb => kIsWeb;

bool get isIos => !kIsWeb && (Platform.isIOS || Platform.isMacOS);

bool get isAndroid => !kIsWeb && Platform.isAndroid;
