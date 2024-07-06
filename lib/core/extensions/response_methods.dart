import 'package:dio/dio.dart';

import '../../common/model/failure_model.dart';

extension ResponseHandler on Response {
  dynamic handleResponse() async {
    if (statusCode == 500) {
      throw FailureModel(
        message: data["error"],
        state: statusCode,
      );
    } else if (statusCode == 401 && statusMessage == "Unauthorized") {
      if (data is Map &&
          data.containsKey("code") &&
          data["code"].toString().contains("auth")) {
        throw FailureModel(
          message: data["error"],
          state: statusCode,
        );
      }
      // GoRouter.of(navigatorKey.currentState!.context)
      //     .goNamed(LoginScreen.route);
      // locator<PreferenceServices>().deleteAll();
      return;
    } else if (statusCode! > 299) {
      throw FailureModel(
        message: data["message"],
        state: statusCode,
      );
    } else {
      return data;
    }
  }
}

extension DioExceptionHandler on DioException {
  String handleDioException(DioExceptionType dioExceptionType) {
    switch (dioExceptionType) {
      case DioExceptionType.connectionTimeout:
        return "Sorry, something went wrong. Please try again later.";
      case DioExceptionType.sendTimeout:
        return "Sorry, something went wrong. Please try again later.";
      case DioExceptionType.receiveTimeout:
        return "Sorry, something went wrong. Please try again later.";
      case DioExceptionType.badCertificate:
        return "Sorry, something went wrong. Please try again later."
            "Sorry, something went wrong. Please try again later.";
      case DioExceptionType.badResponse:
        return "Sorry, something went wrong. Please try again later.";
      case DioExceptionType.cancel:
        return "Sorry, something went wrong. Please try again later.";
      case DioExceptionType.connectionError:
        return "Sorry, something went wrong. Please try again later.";
      case DioExceptionType.unknown:
        return "No internet connection\nPlease check your internet";
    }
  }
}
