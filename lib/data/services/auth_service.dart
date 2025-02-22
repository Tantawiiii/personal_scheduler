import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthService {
  final SharedPreferences _prefs;

  AuthService(this._prefs);

  Future<User?> signIn(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      if (email == 'test@test.com' && password == '123456') {
        final user = User(
          id: '1',
          email: email,
          name: 'Test User',
          photoUrl: '',
        );
        await _prefs.setString('user', user.toJson().toString());
        return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _prefs.clear();
  }

  Future<User?> getCurrentUser() async {
    final userStr = _prefs.getString('user');
    if (userStr != null) {
      return User.fromJson(Map<String, dynamic>.from(userStr as Map));
    }
    return null;
  }
}
