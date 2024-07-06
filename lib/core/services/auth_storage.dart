import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthStorage extends GetxService {
  final GetStorage _box = GetStorage();
  final String _userTokenKey = 'user_token';
  final String _userIdKey = 'user_id';

  Future<AuthStorage> init() async {
    // Initialization tasks if necessary
    return this;
  }

  String? getToken() {
    return _box.read(_userTokenKey);
  }

  String? getUserId() {
    return _box.read(_userIdKey);
  }

  void saveTokenAndUserId(String token, String userId) {
    _box.write(_userTokenKey, token);
    _box.write(_userIdKey, userId);
  }

  void removeTokenAndUserId() {
    _box.remove(_userTokenKey);
    _box.remove(_userIdKey);
  }

  bool isLoggedIn() {
    return _box.hasData(_userTokenKey) && _box.hasData(_userIdKey);
  }
}
