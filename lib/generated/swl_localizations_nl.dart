import 'swl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class SwlTempNl extends SwlTemp {
  SwlTempNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Terug';

  @override
  String get cancel => 'Annuleren';

  @override
  String get save => 'Opslaan';

  @override
  String get goOn => 'Doorgaan';

  @override
  String get close => 'Sluiten';

  @override
  String get networkErrorSomethingWentWrong => 'Er is iets misgegaan, probeer het later opnieuw.';

  @override
  String get networkErrorNoInternetConnection => 'Controleer uw internetverbinding.';

  @override
  String get networkErrorNoAuthentication => 'U bent niet geauthenticeerd.';

  @override
  String get errorDefault => 'Er is iets misgegaan.';

  @override
  String get internetConnectionError => 'Controleer of u een werkende netwerkverbinding heeft.';

  @override
  String get internetCertificateConnectionError => 'U bent verbonden met een onveilig netwerk.';

  @override
  String get internalServerError => 'Er is iets mis met de server. Probeer het later opnieuw.';

  @override
  String get loginError => 'Er is iets misgegaan bij het authenticeren van de app, probeer het later opnieuw.';

  @override
  String get search => 'Zoeken';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nee';

  @override
  String get fieldRequired => 'Dit veld is verplicht';

  @override
  String get passwordSubtext => 'Het wachtwoord moet minstens 8 tekens, 1 cijfer en 1 symbool bevatten';

  @override
  String get emailValidation => 'E-mailadres is ongeldig';

  @override
  String get passwordIsTooShort => 'Wachtwoord is te kort';

  @override
  String get invalidPassword => 'Wachtwoord is ongeldig';

  @override
  String get phoneNumberIsInvalid => 'Telefoonnummer is ongeldig';
}
