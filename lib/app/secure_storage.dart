import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String SECURE_KEY_USER_TOKEN = "SECURE_KEY_USER_TOKEN";

class SecureStorage {
  final secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  setUserTokenEncrypted(String token) async {
    await secureStorage.write(key: SECURE_KEY_USER_TOKEN, value: token);
  }

  Future<String> getUserToken() async =>
      await secureStorage.read(key: SECURE_KEY_USER_TOKEN) ?? "";

  removeUserToken() async {
    await secureStorage.delete(key: SECURE_KEY_USER_TOKEN);
  }
}
