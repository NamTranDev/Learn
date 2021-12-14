abstract class IPreference {
  Future init();
  bool isFirstLogin();
  bool isLogin();
  void storeLogin(bool isLogin);
  void storeLoginInfo(String email, String password);
  void clearLoginInfo();
  String? username();
  String? password();
}
