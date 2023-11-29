import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class Token {
  final String _tokenKey = 'token_key';
  final Logger _logger = Logger();

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenKey, token);
    _logger.d('Token setado: $token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    _logger.d('Token obtido: $token');
    return token;
  }
}
