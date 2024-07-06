import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';


import '../../common/model/api_response_model.dart';
import '../extensions/response_handle.dart';
import '../services/service.auth.dart';

enum HTTPRequestEnum { GET, POST, delete, put }

class ApiManger extends GetConnect {
  ApiManger() {
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 50);

    httpClient.addRequestModifier((Request request) {
      request.headers.addAll({
        'lang': 'ar',
        'Accept': 'application/json',
        'X-Country-Code': 'SA',
        'X-Currency-Id': '1',
      });
      return request;
    });
  }

  Future<ResponseModel> execute({
    required String url,
    required HTTPRequestEnum HTTPRequestMethod,
    dynamic query,
    bool isAuth = false,
  }) async {
    log("[${HTTPRequestMethod.name}]  ${url}", name: "http-request");

    Response? response;
    try {
      if (HTTPRequestMethod == HTTPRequestEnum.GET) {
        response = await get(
          url,
          headers: {
            'Authorization': "Bearer ${Get.find<AuthService>().token}",
          },
        );
      } else if (HTTPRequestMethod == HTTPRequestEnum.delete) {
        response = await delete(
          url,
          headers: {
            'Authorization': "Bearer ${Get.find<AuthService>().token}",
          },
        );
      } else if (HTTPRequestMethod == HTTPRequestEnum.put) {
        response = await put(
          url,
          query,
          headers: {
            'Authorization': "Bearer ${Get.find<AuthService>().token}",
          },
        );
      } else {
        print(query);
        response = await post(
          url,
          query,
          headers: {
            'Authorization': "Bearer ${Get.find<AuthService>().token}",
          },
        );
      }

      if (response.hasError) {
        log(
          "\x1B[31m [${HTTPRequestMethod.name}] [${response.statusCode.toString()}] ${url}\x1B[31m",
          name: "http-error",
        );
        if (response.statusCode == 400 ||
            response.statusCode == 422 ||
            response.statusCode == 406 ||
            response.statusCode == 500 ||
            response.statusCode == 403) {
          throw BadRequestException(response.body["message"]);
        }

        throw NetworkError(
          response.statusCode.toString() + response.bodyString.toString(),
        );
      }
    } catch (e) {
      log(
        "\x1B[31m [${HTTPRequestMethod.name}] [${response!.statusCode.toString()}] ${url}\x1B[31m",
        name: "http-error",
      );

      rethrow;
    }

    if (HTTPRequestMethod == HTTPRequestEnum.GET) {
      if (response.body["data"] != null) {
        if (response.body["data"] is List) {
          if (response.body["data"].length == 0) {
            throw EmptyDataException("The response data is empty.");
          }
        }
      }
    }

    ResponseModel responseModel = ResponseModel(
      url: response.request!.url.toString(),
      status: true,
      statusCode: 200,
      message: "Success",
      data: response.body,
      query: query.toString(),
      httpRequest: HTTPRequestMethod,
    );

    log("\x1B[32m [${HTTPRequestMethod.name}] [${responseModel.statusCode}] ${url}\x1B[0m",
        name: "http-response");

    return responseModel;
  }
}
