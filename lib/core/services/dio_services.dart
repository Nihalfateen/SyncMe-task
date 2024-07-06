import 'package:dio/dio.dart';
import 'package:sync_app/core/extensions/response_methods.dart';


import '../../common/model/failure_model.dart';
import '../config/dio_options.dart';
import '../extensions/dio_network_logger.dart';

class DioServices {
  Dio dio = Dio()..interceptors.add(DioNetworkLogger());

  Future<dynamic> getRequest(String apiUrl,
      {Map<String, dynamic>? parms, bool? responseByts}) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      Response response = parms == null
          ? await dio.get(apiUrl,
              options: Options(
                  responseType:
                      responseByts == true ? ResponseType.bytes : null))
          : await dio.get(apiUrl,
              queryParameters: parms,
              options: Options(
                  responseType:
                      responseByts == true ? ResponseType.bytes : null));

      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
          message: e.handleDioException(e.type),
          state: 0,
        );
      }
      throw Exception(e);
    }
  }

  /*
   * Post Request Function
   */
  Future<dynamic> postRequest(body, String apiUrl,
      {bool hasImages = false}) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      Response response = await dio.post(apiUrl,
          data: hasImages == true ? FormData.fromMap(body) : body);
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
          message: e.handleDioException(e.type),
          state: 0,
        );
      }
      throw Exception(e);
    }
  }

  Future<dynamic> putRequest(
    dynamic body,
    String apiUrl,
  ) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      Response response = await dio.put(apiUrl, data: body);
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
          message: e.handleDioException(e.type),
          state: 0,
        );
      }
      throw Exception(e);
    }
  }

  Future<dynamic> patchRequest(dynamic body, String apiUrl,
      {bool enableToken = false}) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      Response response = await dio.patch(apiUrl, data: body);
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(message: e.handleDioException(e.type), state: 0);
      }
      throw Exception(e);
    }
  }

  /*
   * Delete Request Function
   */
  Future<dynamic> deleteRequest(String apiUrl) async {
    try {
      dio.options = await DioConfigOptions.getBaseOption();
      Response response = await dio.delete(apiUrl);
      return response.handleResponse();
    } catch (e) {
      if (e is DioException) {
        throw FailureModel(
          message: e.handleDioException(e.type),
          state: 0,
        );
      }
      throw Exception(e);
    }
  }
}
