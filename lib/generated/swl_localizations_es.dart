import 'swl_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class SwlTempEs extends SwlTemp {
  SwlTempEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Atrás';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String get goOn => 'Continuar';

  @override
  String get close => 'Cerrar';

  @override
  String get networkErrorSomethingWentWrong =>
      'Algo salió mal, por favor inténtelo de nuevo más tarde.';

  @override
  String get networkErrorNoInternetConnection =>
      'Verifique su conexión a Internet.';

  @override
  String get networkErrorNoAuthentication => 'No está autenticado.';

  @override
  String get errorDefault => 'Algo salió mal.';

  @override
  String get internetConnectionError =>
      'Compruebe si tiene una conexión de red funcionando.';

  @override
  String get internetCertificateConnectionError =>
      'Está conectado a una red insegura.';

  @override
  String get internalServerError =>
      'Algo anda mal con el servidor. Por favor, inténtelo de nuevo más tarde.';

  @override
  String get loginError =>
      'Algo salió mal al autenticar la aplicación, por favor inténtelo de nuevo más tarde.';

  @override
  String get search => 'Buscar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get delete => 'Eliminar';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get fieldRequired => 'Este campo es obligatorio';

  @override
  String get passwordSubtext =>
      'La contraseña debe contener al menos 8 caracteres, 1 dígito y 1 símbolo';

  @override
  String get emailValidation => 'El correo electrónico es inválido';

  @override
  String get passwordIsTooShort => 'La contraseña es demasiado corta';

  @override
  String get invalidPassword => 'La contraseña es inválida';

  @override
  String get phoneNumberIsInvalid => 'El número de teléfono es inválido';
}
