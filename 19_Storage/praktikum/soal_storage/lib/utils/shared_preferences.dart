import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_storage/models/account_model.dart';

String _keyName = 'name';
String _keyEmail = 'email';
String _keyPassword = 'password';
String _loginData = 'token';

class SharedPref {
  static Future<void> saveLoginSession({required bool loginData}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setBool(_loginData, loginData);
  }

  static Future<bool?> getLoginSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool? loginSession = pref.getBool(_loginData);
    return loginSession;
  }

  static Future<void> saveAccountInfo({
    required String name,
    required String email,
    required String password,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(_keyName, name);
    await pref.setString(_keyEmail, email);
    await pref.setString(_keyPassword, password);
  }

  static Future<AccountModel> getAccountInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final name = pref.getString(_keyName);
    final email = pref.getString(_keyEmail);
    final password = pref.getString(_keyPassword);

    return AccountModel(
      name: name,
      email: email,
      password: password,
    );
  }

  static void removeAllKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
