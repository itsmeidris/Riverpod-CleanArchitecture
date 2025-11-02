import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final String accessToken = "access_token";

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: accessToken);
  }

  Future<void> removeAccessToken() async {
    await _secureStorage.delete(key: accessToken);
  }
}
