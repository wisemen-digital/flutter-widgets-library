import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'swl_localizations_de.dart';
import 'swl_localizations_en.dart';
import 'swl_localizations_es.dart';
import 'swl_localizations_fr.dart';
import 'swl_localizations_ja.dart';
import 'swl_localizations_nl.dart';
import 'swl_localizations_ro.dart';

/// Callers can lookup localized strings with an instance of SwlTemp
/// returned by `SwlTemp.of(context)`.
///
/// Applications need to include `SwlTemp.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/swl_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SwlTemp.localizationsDelegates,
///   supportedLocales: SwlTemp.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the SwlTemp.supportedLocales
/// property.
abstract class SwlTemp {
  SwlTemp(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SwlTemp? of(BuildContext context) {
    return Localizations.of<SwlTemp>(context, SwlTemp);
  }

  static const LocalizationsDelegate<SwlTemp> delegate = _SwlTempDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('de'),
    Locale('es'),
    Locale('fr'),
    Locale('ja'),
    Locale('nl'),
    Locale('ro')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Flutter Core'**
  String get appName;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @goOn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get goOn;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @networkErrorSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again later.'**
  String get networkErrorSomethingWentWrong;

  /// No description provided for @networkErrorNoInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection.'**
  String get networkErrorNoInternetConnection;

  /// No description provided for @networkErrorNoAuthentication.
  ///
  /// In en, this message translates to:
  /// **'You are not authenticated.'**
  String get networkErrorNoAuthentication;

  /// No description provided for @errorDefault.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorDefault;

  /// No description provided for @internetConnectionError.
  ///
  /// In en, this message translates to:
  /// **'Check if you have a working network connection.'**
  String get internetConnectionError;

  /// No description provided for @internetCertificateConnectionError.
  ///
  /// In en, this message translates to:
  /// **'You are connected to an insecure network.'**
  String get internetCertificateConnectionError;

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'Something is wrong with the server. Please try again later.'**
  String get internalServerError;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong with authenticating the app, please try again later.'**
  String get loginError;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @passwordSubtext.
  ///
  /// In en, this message translates to:
  /// **'Password should contain at least 8 characters, 1 digit and 1 symbol'**
  String get passwordSubtext;

  /// No description provided for @emailValidation.
  ///
  /// In en, this message translates to:
  /// **'Email is invalid'**
  String get emailValidation;

  /// No description provided for @passwordIsTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password is too short'**
  String get passwordIsTooShort;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is invalid'**
  String get invalidPassword;

  /// No description provided for @phoneNumberIsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Phone number is invalid'**
  String get phoneNumberIsInvalid;
}

class _SwlTempDelegate extends LocalizationsDelegate<SwlTemp> {
  const _SwlTempDelegate();

  @override
  Future<SwlTemp> load(Locale locale) {
    return SynchronousFuture<SwlTemp>(lookupSwlTemp(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr', 'ja', 'nl', 'ro'].contains(locale.languageCode);

  @override
  bool shouldReload(_SwlTempDelegate old) => false;
}

SwlTemp lookupSwlTemp(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return SwlTempDe();
    case 'en': return SwlTempEn();
    case 'es': return SwlTempEs();
    case 'fr': return SwlTempFr();
    case 'ja': return SwlTempJa();
    case 'nl': return SwlTempNl();
    case 'ro': return SwlTempRo();
  }

  throw FlutterError(
    'SwlTemp.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
