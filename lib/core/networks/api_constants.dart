class ApiConstants {
  static const String baseUrl = 'https://xyzys.space/api';
  static const String loginPath = '$baseUrl/login';
  static const String registerPath = '$baseUrl/register';
  static const String forgetPasswordPath = '$baseUrl/forget_password';
  static const String updateForgetPasswordPath =
      '$baseUrl/update_forgotten_password';
  static const String currencyPath = '$baseUrl/currencies';
  static const String banksPath = '$baseUrl/banks';
  static const String companiesPath = '$baseUrl/companies';
  static const String ingotsAndCoinsPath = '$baseUrl/ingots-coins';
  static const String goldPath = '$baseUrl/gold';
  static const String articlesPath = '$baseUrl/articles';
  static const String addFavoritePath = '$baseUrl/favorites/add';
  static const String removeFavoritePath = '$baseUrl/favorites/remove';
  static const String storagePath = 'https://xyzys.space/storage/';

  static String storageUrl(String path) {
    return '$storagePath$path';
  }

  static String articleDetailsPath(int articleId) {
    return '$articlesPath/$articleId';
  }

  static String currencyFilterWithTypeAndDate({
    required String type,
    required int currencyId,
    required DateTime dateTime,
  }) {
    var nowDate = DateTime.now();
    return '$baseUrl/currencies/historical?currency_id=$currencyId&type=$type&start_date=${DateTime(
        nowDate.year, nowDate.month, nowDate.day - 7)}';
  }
}
