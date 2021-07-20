import 'package:data/local/secure_storage/key_manager.dart';
import 'package:data/local/secure_storage/key_manager_impl.dart';
import 'package:data/local/shared_preference/shared_preference_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) => FlutterSecureStorage());

final keyManagerProvider = Provider<KeyManager>((ref) {
  final flutterSecureStorage = ref.read<FlutterSecureStorage>(flutterSecureStorageProvider);
  return KeyManagerImpl(flutterSecureStorage);
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPreferenceManagerProvider = Provider<SharedPreferenceManager>((ref) {
  final _sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SharedPreferenceManager(sharedPreferences: _sharedPreferences);
});
