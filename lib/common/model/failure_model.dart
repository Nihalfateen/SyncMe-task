class FailureModel {
  FailureModel({
    required this.state,
    required this.message,
  });

  int? state;
  String? message;

  FailureModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    message = json['message'];
  }
}
