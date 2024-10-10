import 'dart:convert';

import 'package:carma_app/src/core/utils/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

const localCacheBox = "local_cache";
const loginKey = 'isLoggedIn';

class SessionManager {
  final secureStorage = const FlutterSecureStorage();
  late final Box _localCache;

  SessionManager() {
    _localCache = Hive.box(localCacheBox);
  }

  Future<void> storeBool(String key, bool value) async {
    await _localCache.put(key, value);
  }

  bool? getBool(String key) {
    return _localCache.get(key) as bool?;
  }

  Future<void> storeBuiltInType(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> getCachedBuiltInType(String key) async {
    return await secureStorage.read(key: key);
  }

  Future<void> storeObject<T>(
    String key,
    T object,
    Map<String, dynamic> Function(T obj) toJson,
  ) async {
    final json = toJson(object);
    final jsonString = jsonEncode(json);
    await _localCache.put(key, jsonString);
  }

  T? getCachedObject<T>(
    String key,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    try {
      final dynamic storedValue = _localCache.get(key);
      if (storedValue == null) return null;

      if (storedValue is String && storedValue.isNotEmpty) {
        final Map<String, dynamic> json =
            jsonDecode(storedValue) as Map<String, dynamic>;
        return fromJson(json);
      }

      return null;
    } catch (e) {
      AppLogger.logError(
        "Error getting cached object: $e",
        tag: "SessionManager",
      );
      return null;
    }
  }

  Future<void> storeObjectList<T>(
    String listKey,
    List<T> objects,
    Map<String, dynamic> Function(T obj) toJson,
  ) async {
    try {
      List<Map<String, dynamic>> jsonList = objects.map(toJson).toList();
      String jsonString = jsonEncode(jsonList);
      await _localCache.put(listKey, jsonString);
    } catch (e) {
      AppLogger.logError(
        "Error trying to store List of Objects in cached memory",
      );
    }
  }

  List<T>? getObjectList<T>(
    String listKey,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      String? jsonString = _localCache.get(listKey);
      if (jsonString != null) {
        List<dynamic> jsonList = jsonDecode(jsonString);
        return jsonList
            .map((json) => fromJson(json as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      AppLogger.logError(
        "Error trying to get List of Objects from cached memory",
      );
    }

    return null;
  }

  Future<void> deleteStoredBuiltInType(String key) async {
    await _localCache.delete(key);
  }
}
