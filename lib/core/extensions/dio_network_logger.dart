import 'package:dio/dio.dart' as dio;
import 'package:logger/logger.dart';

class DioNetworkLogger extends dio.Interceptor {
  @override
  void onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
    Logger().w(
      '''
    🚀🚀 Request 🚀🚀
    URL: ${options.baseUrl}${options.path}
    Method: ${options.method}
    Headers: ${options.headers}
    Params: ${options.queryParameters}
    Body: ${options.data.toString()}
    ReceiveTimeout: ${options.receiveTimeout}
    ''',
    );
  }

  @override
  void onResponse(
    dio.Response response,
    dio.ResponseInterceptorHandler handler,
  ) {
    super.onResponse(response, handler);
    Logger().w(
      '''
    📜📜Response 📜📜
     URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}
    Status Code: ${response.statusCode}
    Status Message: ${response.statusMessage}
    Headers: ${response.headers}
    Response Type: ${response.requestOptions.responseType.name}
    Response Body: ${response.data}
    ''',
    );
  }
}
