import 'app_flavors.dart';

class AppUrl {
  static const stagingUrl = 'https://perkfy.app/api/';
  static const productionUrl = 'https://perkfy.app/api/';
  static getServerUrl(String appFlavor) {
    switch (appFlavor) {
      case AppFlavors.production:
        return AppUrl.productionUrl;
      case AppFlavors.staging:
        return AppUrl.stagingUrl;
      default:
        return AppUrl.stagingUrl;
    }
  }

  static const String getSignUp = "User/Add";
  static const String getLogin = "User/Login";
  static const String updateUser = "User/Edit";
  static String getPointSettings = 'PointSetting/GetByBrand';
  static String addPoints = 'Transaction/Encrypt';
  static String checkQr = 'Transaction/Check';
  static String getPunchCards = 'PunchCardSetting/GetPaged';
  static String getRewards = "RewardSetting/GetByBrand";
}
