import 'package:dio/dio.dart';



import '../../main.dart';
import '../constants/app_urls.dart';
import '../services/locator_services.dart';
import '../services/preference_services.dart';

class DioConfigOptions {
  static Future<BaseOptions> getBaseOption() async {
    BaseOptions options = BaseOptions(
        baseUrl: AppUrl.stagingUrl,
        connectTimeout: const Duration(milliseconds: 80000),
        receiveTimeout: const Duration(milliseconds: 80000),
        followRedirects: false,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Content-Type': 'application/json',
          "Accept": "*/*",
          'authorization':
              "Bearer ${await locator<Preference>().getString(PrefKeys.accessToken)}",
          
        });

    return options;
  }
}
