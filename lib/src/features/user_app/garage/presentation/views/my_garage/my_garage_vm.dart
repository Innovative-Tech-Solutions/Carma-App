import 'package:carma_app/src/app/app_setup.router.dart';
import 'package:carma_app/src/core/utils/enhanced_base_view_model.dart';
import 'package:carma_app/src/core/utils/toast_helper.dart';
import 'package:carma_app/src/features/user_app/garage/data/model/add_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/data/model/delete_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/car_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/garage_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/repository/garage_repository.dart';
import 'package:stacked_services/stacked_services.dart';

class MyGarageViewModel extends EnhancedBaseViewModel {
  final GarageRepository _garageRepository;
  final NavigationService _navigationService;

  MyGarageViewModel(
      {required GarageRepository garageRepository,
      required NavigationService navigationService})
      : _garageRepository = garageRepository,
        _navigationService = navigationService {
    getGarage();
  }

  Garage? _garage;
  Garage? get garage => _garage;

  List<Car> get cars => _garage?.myCars ?? [];

  goToAddGarage() => _navigationService.navigateTo(Routes.addGarageScreen);

  goBack() => _navigationService.back();

  Future<void> getGarage() async {
    final result = await runEitherFuture(_garageRepository.getMyGarage());
    if (result != null && result.success && result.garage != null) {
      _garage = result.garage;
      notifyListeners();
    }
  }

  Future<void> createGarage(String name) async {
    final result = await runEitherFuture(_garageRepository.createGarage(name));
    if (result != null && result.success && result.garage != null) {
      _garage = result.garage;
      notifyListeners();
    }
  }

  Future<void> deleteGarage(String garageId) async {
    final result =
        await runEitherFuture(_garageRepository.deleteGarage(garageId));
    if (result != null && result.success) {
      _garage = null;
      notifyListeners();
    }
  }

  Future<void> addCar(AddCarParams carParams) async {
    final result = await runEitherFuture(_garageRepository.addCar(carParams));
    if (result != null && result.success && result.garage != null) {
      _garage = result.garage;
      notifyListeners();
    }
  }

  Future<void> deleteCar() async {
    DeleteCarParams carParams =
        DeleteCarParams(carId: cars.last.id ?? "", garageId: _garage?.id ?? "");
    final result =
        await runEitherFuture(_garageRepository.deleteCar(carParams));
    if (result != null && result.success && result.myCars != null) {
      _garage?.myCars = result.myCars!;
      notifyListeners();
    } else {
      Toast.showErrorToast(message: "Unable to delete your car");
    }
  }

  Future<void> getMyCars() async {
    final result = await runEitherFuture(_garageRepository.getMyCars());
    if (result != null && result.success && result.myCars != null) {
      _garage?.myCars = result.myCars!;
      notifyListeners();
    }
  }
}
