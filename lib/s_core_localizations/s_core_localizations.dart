import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:wisewidgetslibrary/generated/swl_localizations.dart';

abstract class Swl extends SwlTemp {
  Swl(super.locale);

  //! VERGEET NIET DIT COMMAND TE RUNNEN IN TERMINAL: flutter gen-l10n

  static SwlTemp of(BuildContext context) {
    final instance = maybeOf(context);
    assert(
      instance != null,
      "Did you add Swl.delegate in localizationsDelegates?\nLanguage not supported: '${PlatformDispatcher.instance.locale.languageCode}' is not suppored in Flutter Core please add it in the library.",
    );
    return instance!;
  }

  static SwlTemp? maybeOf(BuildContext context) {
    return Localizations.of<SwlTemp>(context, SwlTemp);
  }

  static const LocalizationsDelegate<SwlTemp> delegate = SwlTemp.delegate;
}
