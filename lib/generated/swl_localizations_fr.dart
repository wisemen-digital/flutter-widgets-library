import 'swl_localizations.dart';

/// The translations for French (`fr`).
class SwlTempFr extends SwlTemp {
  SwlTempFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Retour';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get goOn => 'Continuer';

  @override
  String get close => 'Fermer';

  @override
  String get networkErrorSomethingWentWrong => 'Une erreur s\'est produite, veuillez réessayer plus tard.';

  @override
  String get networkErrorNoInternetConnection => 'Vérifiez votre connexion Internet.';

  @override
  String get networkErrorNoAuthentication => 'Vous n\'êtes pas authentifié.';

  @override
  String get errorDefault => 'Une erreur s\'est produite';

  @override
  String get internetConnectionError => 'Vérifiez si vous avez une connexion réseau fonctionnelle.';

  @override
  String get internetCertificateConnectionError => 'Vous êtes connecté à un réseau non sécurisé.';

  @override
  String get internalServerError => 'Quelque chose ne va pas avec le serveur. Veuillez réessayer ultérieurement.';

  @override
  String get loginError => 'Quelque chose s\'est mal passé lors de l\'authentification de l\'application, veuillez réessayer plus tard.';

  @override
  String get search => 'Rechercher';

  @override
  String get confirm => 'Confirmer';

  @override
  String get delete => 'Supprimer';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get fieldRequired => 'Ce champ est requis';

  @override
  String get passwordSubtext => 'Le mot de passe doit contenir au moins 8 caractères, 1 chiffre et 1 symbole';

  @override
  String get emailValidation => 'L\'adresse e-mail est invalide';

  @override
  String get passwordIsTooShort => 'Le mot de passe est trop court';

  @override
  String get invalidPassword => 'Le mot de passe est invalide';

  @override
  String get phoneNumberIsInvalid => 'Le numéro de téléphone est invalide';
}
