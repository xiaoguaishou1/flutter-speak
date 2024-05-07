import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  // 键名，用于保存和获取 Token
  static const String _tokenKey = 'userToken';

  // 保存 Token 到 SharedPreferences
  static Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_tokenKey, token);
  }

  // 从 SharedPreferences 获取 Token
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }
}
