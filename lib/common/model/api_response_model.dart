



import '../../core/config/api_manger.dart';

class ResponseModel {

  final bool status;
  final String? message;
  final dynamic data;


  final String url;
  final int statusCode;
  final dynamic query;
  final HTTPRequestEnum httpRequest;

  ResponseModel({
    required this.url,
    required this.status,
    required this.statusCode,
    required this.data,
    required this.query,
    this.message,
    required this.httpRequest,
  });
}
