import 'package:carma_app/src/core/model/user_data.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/core/utils/session_manager.dart';
import 'package:stacked/stacked.dart';

class UserService with ListenableServiceMixin {
  static const String userDataKey = 'user_data';
  final SessionManager _sessionManager;
  UserData? _currentUser;

  UserService(this._sessionManager) {
    _loadUserData();
  }

  UserData? get currentUser => _currentUser;

  void _loadUserData() {
    try {
      _currentUser = _sessionManager.getCachedObject(
        userDataKey,
        (json) => UserData.fromJson(json),
      );
      AppLogger.log(
        "Loaded user data: ${_currentUser?.toString()}",
        tag: "UserService",
      );
    } catch (e) {
      AppLogger.logError(
        "Error loading user data: $e",
        tag: "UserService",
      );
      _currentUser = null;
    }
    notifyListeners();
  }

  Future<void> setCurrentUser(UserData? userData) async {
    _currentUser = userData;
    if (userData != null) {
      await _sessionManager.storeObject(
        userDataKey,
        userData,
        (obj) => obj.toJson(),
      );
    } else {
      await _sessionManager.deleteStoredBuiltInType(userDataKey);
    }
    notifyListeners();
  }

  Future<void> updateActivationToken(String token) async {
    if (_currentUser != null) {
      final updatedUser = _currentUser!.copyWith(
        activationToken: token,
        updatedAt: DateTime.now(),
      );
      await setCurrentUser(updatedUser);
    }
  }

  Future<void> clearUserData() async {
    await _sessionManager.deleteStoredBuiltInType(userDataKey);
    _currentUser = null;
    notifyListeners();
  }
}
