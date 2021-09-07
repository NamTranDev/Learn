import 'package:shared_preferences/shared_preferences.dart';

abstract class IPref {

}

class Preference implements IPref {
  SharedPreferences? _mPref;

  Preference() {
    _getPrefInstance();
  }

  void _getPrefInstance() async =>
      _mPref = await SharedPreferences.getInstance();
}
