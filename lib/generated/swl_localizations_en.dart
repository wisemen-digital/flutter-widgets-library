import 'swl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SwlTempEn extends SwlTemp {
  SwlTempEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Back';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get goOn => 'Continue';

  @override
  String get close => 'Close';

  @override
  String get networkErrorSomethingWentWrong => 'Something went wrong, please try again later.';

  @override
  String get networkErrorNoInternetConnection => 'Check your internet connection.';

  @override
  String get networkErrorNoAuthentication => 'You are not authenticated.';

  @override
  String get errorDefault => 'Something went wrong';

  @override
  String get internetConnectionError => 'Check if you have a working network connection.';

  @override
  String get internetCertificateConnectionError => 'You are connected to an insecure network.';

  @override
  String get internalServerError => 'Something is wrong with the server. Please try again later.';

  @override
  String get loginError => 'Something went wrong with authenticating the app, please try again later.';

  @override
  String get search => 'Search';

  @override
  String get confirm => 'Confirm';

  @override
  String get delete => 'Delete';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get passwordSubtext => 'Password should contain at least 8 characters, 1 digit and 1 symbol';

  @override
  String get emailValidation => 'Email is invalid';

  @override
  String get passwordIsTooShort => 'Password is too short';

  @override
  String get invalidPassword => 'Password is invalid';

  @override
  String get phoneNumberIsInvalid => 'Phone number is invalid';
}
