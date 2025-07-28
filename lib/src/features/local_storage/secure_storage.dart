import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

part 'secure_storage.g.dart';

@riverpod
class SecureStorageProvider extends _$SecureStorageProvider {
  @override
  Future<SecureStorage> build() {
    return SecureStorage.getInstance(
      keys: {
        'authUser',
        'onBoard',
        'portalAuthUser',
        'userThemeType',
        'communityFilter',
        'resumeRemovedSections',
      },
    );
  }
}

class SecureStorageProviderMock extends _$SecureStorageProvider
    with Mock
    implements SecureStorageProvider {}

class SecureStorage {
  SecureStorage._(
    this._flutterSecureStorage,
    this._sharedPreferences,
    this._cache,
  );

  late final FlutterSecureStorage? _flutterSecureStorage;
  late final SharedPreferences? _sharedPreferences;
  late final Map<String, String> _cache;

  static Future<SecureStorage> getInstance({required Set<String> keys}) async {
    final cache = <String, String>{};

    if (kIsWeb) {
      // Use SharedPreferences for Flutter Web
      final sharedPreferences = await SharedPreferences.getInstance();
      for (final key in keys) {
        final value = sharedPreferences.getString(key);
        if (value != null) {
          cache[key] = value;
        }
      }
      return SecureStorage._(null, sharedPreferences, cache);
    } else {
      // Use FlutterSecureStorage for other platforms
      const flutterSecureStorage = FlutterSecureStorage();
      await keys
          .map(
            (key) => flutterSecureStorage.read(key: key).then((value) {
              if (value != null) {
                cache[key] = value;
              }
            }),
          )
          .wait;
      return SecureStorage._(flutterSecureStorage, null, cache);
    }
  }

  String? get(String key) => _cache[key];

  Future<void> set(String key, String value) async {
    _cache[key] = value;
    if (kIsWeb && _sharedPreferences != null) {
      await _sharedPreferences.setString(key, value);
    } else if (_flutterSecureStorage != null) {
      await _flutterSecureStorage.write(key: key, value: value);
    }
  }

  Future<void> remove(String key) async {
    _cache.remove(key);
    if (kIsWeb && _sharedPreferences != null) {
      await _sharedPreferences.remove(key);
    } else if (_flutterSecureStorage != null) {
      await _flutterSecureStorage.delete(key: key);
    }
  }
}
