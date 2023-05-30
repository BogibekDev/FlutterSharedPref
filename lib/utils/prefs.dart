import 'dart:convert';

import 'package:shared_pref/models/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static saveObject(SignIn signIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('signin', jsonEncode(signIn));
  }

  static Future<SignIn?> getSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sign = prefs.getString('signin');
    if (sign == null || sign.isEmpty) return null;
    return SignIn.fromJson(jsonDecode(sign));
  }
}
