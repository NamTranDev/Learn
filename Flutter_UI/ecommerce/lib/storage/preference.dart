import 'package:ecommerce/storage/ipreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference implements IPreference {
  final KEY_IS_FIRST_LOGIN = 'KEY_IS_FIRST_LOGIN';
  final KEY_IS_LOGIN = 'KEY_IS_LOGIN';
  final KEY_LOGIN_USER_NAME = 'KEY_LOGIN_USER_NAME';
  final KEY_LOGIN_PASSWORD = 'KEY_LOGIN_PASSWORD';

  Preference._privateConstructor();

  static final Preference _instance = Preference._privateConstructor();

  static IPreference get instance {
    return _instance;
  }

  late SharedPreferences _prefs;

  @override
  Future init() async => _prefs = await SharedPreferences.getInstance();

  @override
  void storeLogin(bool isLogin) => _prefs.setBool(KEY_IS_LOGIN, isLogin);

  @override
  bool isFirstLogin() {
    bool value = _prefs.getBool(KEY_IS_FIRST_LOGIN) ?? true;
    _prefs.setBool(KEY_IS_FIRST_LOGIN, false);
    return value;
  }

  @override
  bool isLogin() => _prefs.getBool(KEY_IS_LOGIN) ?? false;

  @override
  void storeLoginInfo(String email, String password) {
    _prefs.setString(KEY_LOGIN_USER_NAME, email);
    _prefs.setString(KEY_LOGIN_PASSWORD, password);
  }

  @override
  String? username() => _prefs.getString(KEY_LOGIN_USER_NAME);

  @override
  String? password() => _prefs.getString(KEY_LOGIN_PASSWORD);

  @override
  void clearLoginInfo() {
    _prefs.remove(KEY_LOGIN_USER_NAME);
    _prefs.remove(KEY_LOGIN_PASSWORD);
  }
}
