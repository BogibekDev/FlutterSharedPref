import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_pref/models/signup.dart';

class SecurePrefs {
  static storeAccount(Account account) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'account', value: jsonEncode(account));
  }

  static Future<Account?> getAccount() async {
    const storage = FlutterSecureStorage();
    String? accontJson = await storage.read(key: 'account');
    if (accontJson == null || accontJson.isEmpty) return null;
    return Account.fromJson(jsonDecode(accontJson));
  }
}
