import 'swl_localizations.dart';

/// The translations for German (`de`).
class SwlTempDe extends SwlTemp {
  SwlTempDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Zurück';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get goOn => 'Weiter';

  @override
  String get close => 'Schließen';

  @override
  String get networkErrorSomethingWentWrong =>
      'Etwas ist schiefgelaufen, bitte versuchen Sie es später erneut.';

  @override
  String get networkErrorNoInternetConnection =>
      'Überprüfen Sie Ihre Internetverbindung.';

  @override
  String get networkErrorNoAuthentication => 'Sie sind nicht authentifiziert.';

  @override
  String get errorDefault => 'Etwas ist schiefgelaufen.';

  @override
  String get internetConnectionError =>
      'Überprüfen Sie, ob Sie eine funktionierende Netzwerkverbindung haben.';

  @override
  String get internetCertificateConnectionError =>
      'Sie sind mit einem unsicheren Netzwerk verbunden.';

  @override
  String get internalServerError =>
      'Mit dem Server stimmt etwas nicht. Bitte versuchen Sie es später erneut.';

  @override
  String get loginError =>
      'Etwas ist bei der Authentifizierung der App schiefgelaufen, bitte versuchen Sie es später erneut.';

  @override
  String get search => 'Suchen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get delete => 'Löschen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get fieldRequired => 'Dieses Feld ist erforderlich';

  @override
  String get passwordSubtext =>
      'Das Passwort muss mindestens 8 Zeichen, 1 Ziffer und 1 Symbol enthalten';

  @override
  String get emailValidation => 'Die E-Mail-Adresse ist ungültig';

  @override
  String get passwordIsTooShort => 'Das Passwort ist zu kurz';

  @override
  String get invalidPassword => 'Das Passwort ist ungültig';

  @override
  String get phoneNumberIsInvalid => 'Die Telefonnummer ist ungültig';
}
