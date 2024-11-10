import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/enhanced_base_view_model.dart';
import 'package:carma_app/src/core/utils/toast_helper.dart';
import 'package:carma_app/src/features/user_app/garage/data/model/add_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/domain/repository/garage_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class AddGarageViewModel extends EnhancedBaseViewModel {
  final NavigationService _navigationService;
  final GarageRepository _garageRepository;
  final UserService _userService;

  AddGarageViewModel({
    required NavigationService navigationService,
    required GarageRepository garageRepository,
    required UserService userService,
  })  : _navigationService = navigationService,
        _garageRepository = garageRepository,
        _userService = userService;

  String _year = '';
  String _model = '';
  String _make = '';

  String get year => _year;
  String get model => _model;
  String get make => _make;

  void setYear(String year) {
    _year = year;
    notifyListeners();
  }

  void setModel(String model) {
    _model = model;
    notifyListeners();
  }

  void setMake(String make) {
    _make = make;
    notifyListeners();
  }

  void goBack() => _navigationService.back();

  Future<void> addCar() async {
    if (_year.isEmpty || _model.isEmpty || _make.isEmpty) {
      return;
    }

    final params = AddCarParams(
      name: _make,
      model: _model,
      year: _year,
      garageId:
          "670c1e95fc93f43e74c882bb" ?? '', // I need to get this from somewhere
    );

    final result = await runEitherFuture(_garageRepository.addCar(params));
    if (result!.success) {
      // TODO: show a success message
      _navigationService.back();
    } else {
      Toast.showErrorToast(message: 'Failed to add car');
    }
  }
}
