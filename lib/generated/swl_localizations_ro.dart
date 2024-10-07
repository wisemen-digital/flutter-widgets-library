import 'swl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class SwlTempRo extends SwlTemp {
  SwlTempRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Înapoi';

  @override
  String get cancel => 'Anulează';

  @override
  String get save => 'Salvează';

  @override
  String get goOn => 'Continuă';

  @override
  String get close => 'Închide';

  @override
  String get networkErrorSomethingWentWrong => 'Ceva nu a funcționat, vă rugăm să încercați mai târziu.';

  @override
  String get networkErrorNoInternetConnection => 'Verificați conexiunea la internet.';

  @override
  String get networkErrorNoAuthentication => 'Nu sunteți autentificat.';

  @override
  String get errorDefault => 'Ceva a mers greșit';

  @override
  String get internetConnectionError => 'Verificați dacă aveți o conexiune la rețea funcțională.';

  @override
  String get internetCertificateConnectionError => 'Sunteți conectat la o rețea nesigură.';

  @override
  String get internalServerError => 'Ceva este în neregulă cu serverul. Vă rugăm să încercați mai târziu.';

  @override
  String get loginError => 'Ceva a mers greșit cu autentificarea aplicației, vă rugăm să încercați mai târziu.';

  @override
  String get search => 'Caută';

  @override
  String get confirm => 'Confirmă';

  @override
  String get delete => 'Șterge';

  @override
  String get yes => 'Da';

  @override
  String get no => 'Nu';

  @override
  String get fieldRequired => 'Acest câmp este obligatoriu';

  @override
  String get passwordSubtext => 'Parola trebuie să conțină cel puțin 8 caractere, 1 cifră și 1 simbol';

  @override
  String get emailValidation => 'Emailul este invalid';

  @override
  String get passwordIsTooShort => 'Parola este prea scurtă';

  @override
  String get invalidPassword => 'Parola este invalidă';

  @override
  String get phoneNumberIsInvalid => 'Numărul de telefon este invalid';
}
