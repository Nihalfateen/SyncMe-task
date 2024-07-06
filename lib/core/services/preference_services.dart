import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const String fcmToken = 'fcmToken';
  static const String appSettings = 'appSettings';
  static const String languageCode = 'language_code';
  static const String isDark = 'isDark';
  static const String userName = 'userName';
  static const String userLogged = 'userLogged';
  static String accessToken = "accessToken";
  static String encryptionQr = "encryptionQr";
  static String keyQr = "keyQr";
  static String userPassword = "userPassword";
  static String authData = "authData";
  static String userId = "userId";
  static String gainFactor = "gainFactor";
  static String redeemFactor = "redeemFactor";
  static String settingsId = "settingsId";
}

class Preference {
  static late SharedPreferences sb;
  static Future<void> init() async {
    sb = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    try {
      return sb.getString(key);
    } catch (e) {
      return null;
    }
  }

  List<String>? getStringList(String key) {
    try {
      return sb.getStringList(key);
    } catch (e) {
      return null;
    }
  }

  int? getInt(String key) {
    try {
      return sb.getInt(key);
    } catch (e) {
      return null;
    }
  }

  bool? getBool(String key) {
    try {
      return sb.getBool(key);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool?> setString(String key, String value) async {
    try {
      return await sb.setString(key, value);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool?> setStringList(String key, List<String> value) async {
    try {
      return await sb.setStringList(key, value);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool?> setInt(String key, int value) async {
    try {
      return sb.setInt(key, value);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool?> setBool(String key, bool value) async {
    try {
      return await sb.setBool(key, value);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool?> remove(String key) async {
    try {
      return await sb.remove(key);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool?> clear() async {
    try {
      return await sb.clear();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Map<String, dynamic> getSavedObject(String key) {
    try {
      if (sb.getString(key) != null) {
        var json = jsonDecode(sb.getString(key)!);
        return json;
      }

      return {};
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
