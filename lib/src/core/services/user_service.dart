import 'package:carma_app/src/core/model/user_data.dart';
import 'package:stacked/stacked.dart';

class UserService with ListenableServiceMixin {
  UserData? _currentUser = UserData(name: '', email: '');
  UserData? get currentUser => _currentUser;

  void setCurrentUser(UserData? userData) {
    _currentUser = userData;
    notifyListeners();
  }

  void updateActivationToken(String token) {
    if (_currentUser != null) {
      _currentUser = _currentUser!.copyWith(
        activationToken: token,
        updatedAt: DateTime.now(),
      );
      notifyListeners();
    }
  }
}
