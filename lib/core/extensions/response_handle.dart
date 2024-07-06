// Network Error Exception
class NetworkError implements Exception {
  final String message;
  NetworkError([this.message = "Network error occurred."]);

  @override
  String toString() => "NetworkError: $message";
}

// Bad Request Exception
class BadRequestException implements Exception {
  final String message;
  BadRequestException([this.message = "Bad request."]);

  @override
  String toString() => "BadRequestException: $message";
}

// No Internet Exception
class NoInternetException implements Exception {
  final String message;
  NoInternetException([this.message = "No internet connection."]);

  @override
  String toString() => "NoInternetException: $message";
}

// Empty Data Exception
class EmptyDataException implements Exception {
  final String message;
  EmptyDataException([this.message = "Data is empty."]);

  @override
  String toString() => "EmptyDataException: $message";
}
