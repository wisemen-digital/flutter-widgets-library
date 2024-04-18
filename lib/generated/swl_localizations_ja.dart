import 'swl_localizations.dart';

/// The translations for Japanese (`ja`).
class SwlTempJa extends SwlTemp {
  SwlTempJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => '戻る';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get goOn => '続ける';

  @override
  String get close => '閉じる';

  @override
  String get networkErrorSomethingWentWrong => '不具合が生じました';

  @override
  String get networkErrorNoInternetConnection => 'インターネットの接続状況を確認してください';

  @override
  String get networkErrorNoAuthentication => '認証されていません';

  @override
  String get errorDefault => '不具合が生じました';

  @override
  String get internetConnectionError => 'ネットワークに接続されているか確認してください';

  @override
  String get internetCertificateConnectionError => 'ネットワークが不安定です';

  @override
  String get internalServerError => 'サーバの不具合が生じています';

  @override
  String get loginError => 'パスワードが違います。もう一度入力してください。';

  @override
  String get search => '検索';

  @override
  String get confirm => '承認';

  @override
  String get delete => '削除';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get fieldRequired => 'このフィールドは必須です';

  @override
  String get passwordSubtext => 'パスワードは少なくとも8文字、1つの数字、および1つの記号を含む必要があります';

  @override
  String get emailValidation => 'メールアドレスが無効です';

  @override
  String get passwordIsTooShort => 'パスワードが短すぎます';

  @override
  String get invalidPassword => 'パスワードが無効です';

  @override
  String get phoneNumberIsInvalid => '電話番号が無効です';
}
