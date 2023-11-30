import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class UserId {
  final String _userIdKey = 'user_id_key';
  final Logger _logger = Logger();

  Future<void> setUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_userIdKey, userId);
    _logger.d('ID do usuário setado: $userId');
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt(_userIdKey);
    _logger.d('ID do usuário obtido: $userId');
    return userId;
  }
}
