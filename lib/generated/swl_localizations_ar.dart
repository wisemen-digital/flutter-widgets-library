import 'swl_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SwlTempAr extends SwlTemp {
  SwlTempAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'فلاتر كور';

  @override
  String get ok => 'موافق';

  @override
  String get back => 'رجوع';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get goOn => 'استمرار';

  @override
  String get close => 'إغلاق';

  @override
  String get networkErrorSomethingWentWrong => 'حدث خطأ ما، يرجى المحاولة لاحقًا.';

  @override
  String get networkErrorNoInternetConnection => 'تحقق من اتصالك بالإنترنت.';

  @override
  String get networkErrorNoAuthentication => 'لم يتم التحقق من هويتك.';

  @override
  String get errorDefault => 'حدث خطأ ما';

  @override
  String get internetConnectionError => 'تحقق مما إذا كان لديك اتصال شبكي يعمل.';

  @override
  String get internetCertificateConnectionError => 'أنت متصل بشبكة غير آمنة.';

  @override
  String get internalServerError => 'هناك مشكلة في الخادم. يرجى المحاولة لاحقًا.';

  @override
  String get loginError => 'حدث خطأ ما في مصادقة التطبيق، يرجى المحاولة لاحقًا.';

  @override
  String get search => 'بحث';

  @override
  String get confirm => 'تأكيد';

  @override
  String get delete => 'حذف';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get fieldRequired => 'هذه الخانة مطلوبة';

  @override
  String get passwordSubtext => 'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، رقم واحد ورمز واحد';

  @override
  String get emailValidation => 'البريد الإلكتروني غير صالح';

  @override
  String get passwordIsTooShort => 'كلمة المرور قصيرة جدًا';

  @override
  String get invalidPassword => 'كلمة المرور غير صالحة';

  @override
  String get phoneNumberIsInvalid => 'رقم الهاتف غير صالح';
}
