import 'package:data/local/secure_storage/key_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class KeyManagerImpl implements KeyManager {
  KeyManagerImpl(
    this._secureStorage,
  );

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> deleteAllKey() async => await _secureStorage.deleteAll();

  @override
  Future<void> deleteKey(String key) async => await _secureStorage.delete(key: key);

  @override
  Future<Map<String, String>> readAllValue() async => await _secureStorage.readAll();

  @override
  Future<String?> readValue(String key) async => await _secureStorage.read(key: key);

  @override
  Future<void> writeValue(String key, String value) async => await _secureStorage.write(key: key, value: value);
}
