import 'package:shared_preferences/shared_preferences.dart';

class HelperPrefs {
  static late final SharedPreferences i;

  static Future<void> initialize() async {
    i = await SharedPreferences.getInstance();
  }

  static set token(String? value) =>
      value == null ? i.remove('token') : i.setString('token', value);
  static String? get token => i.getString('token');

  static set language(String? value) => i.setString('language', value!);
  static String? get language => i.getString('language');
}
