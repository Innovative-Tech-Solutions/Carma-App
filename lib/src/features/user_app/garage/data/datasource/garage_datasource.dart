import 'package:carma_app/src/core/constants/endpoints.dart';
import 'package:carma_app/src/core/services/dio_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/features/user_app/garage/data/model/add_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/data/model/delete_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/add_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/delete_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/delete_garage_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/garage_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/get_my_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/get_my_garage_response_entity.dart';

abstract class GarageDatasource {
  Future<GarageResponse> createGarage(String nameOfGarage);
  Future<DeleteGarageResponseEntity> deleteGarage(String garageId);
  Future<AddCarResponseEntity> addCar(AddCarParams car);
  Future<DeleteCarResponseEntity> deleteCar(DeleteCarParams car);
  Future<GetMyGarageResponseEntity> getMyGarage();
  Future<GetMyCarResponseEntity> getMyCars();
}

class GarageDataSourceImpl extends GarageDatasource {
  final DioService _dioService;
  final UserService _userService;

  GarageDataSourceImpl({
    required DioService dioService,
    required UserService userService,
  })  : _dioService = dioService,
        _userService = userService;
  @override
  Future<GarageResponse> createGarage(String nameOfGarage) async {
    try {
      final response =
          await _dioService.post(endpoint: EndPoints.createGarage, data: {
        "name": nameOfGarage,
      });

      AppLogger.log("Response from creating garage: $response",
          tag: "createGarage");

      if (response != null) {
        final createGarageResponse = GarageResponse.fromJson(response);
        return createGarageResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while creating garage $e",
          tag: "GarageDataSourceImpl");
      return GarageResponse(
          success: false, message: e.toString(), garage: null);
    }
    return GarageResponse(
        success: false, message: "Unable to fetch your garage", garage: null);
  }

  @override
  Future<AddCarResponseEntity> addCar(AddCarParams car) async {
    try {
      final response = await _dioService.post(
          endpoint: EndPoints.addCar, data: car.toJson());

      AppLogger.log("Response from adding car: $response", tag: "addCar");

      if (response != null) {
        final addCarResponse = AddCarResponseEntity.fromJson(response);
        final user =
            _userService.currentUser!.copyWith(garage: addCarResponse.garage);
        _userService.setCurrentUser(user);
        AppLogger.log("New User from adding car: ${_userService.currentUser}",
            tag: "GarageDataSourceImpl");
        return addCarResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while adding car $e",
          tag: "GarageDataSourceImpl");
      return AddCarResponseEntity(
          success: false, message: e.toString(), garage: null);
    }
    return AddCarResponseEntity(
        success: false, message: "Unable to add your car", garage: null);
  }

  @override
  Future<DeleteCarResponseEntity> deleteCar(DeleteCarParams car) async {
    try {
      final response = await _dioService.delete(
          endpoint: EndPoints.deleteCar, data: car.toJson());

      AppLogger.log("Response from deleting car: $response", tag: "deleteCar");

      if (response != null) {
        final deleteCarResponse = DeleteCarResponseEntity.fromJson(response);
        return deleteCarResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while deleting car $e",
          tag: "GarageDataSourceImpl");
      return DeleteCarResponseEntity(
          success: false, message: e.toString(), myCars: []);
    }
    return DeleteCarResponseEntity(
        success: false, message: "Unable to delete your car", myCars: []);
  }

  @override
  Future<DeleteGarageResponseEntity> deleteGarage(String garageId) async {
    try {
      final response = await _dioService.delete(
          endpoint: EndPoints.deleteGarage, data: {"garage_id": garageId});

      AppLogger.log("Response from deleting garage: $response",
          tag: "deleteGarage");

      if (response != null) {
        final deleteGarageResponse =
            DeleteGarageResponseEntity.fromJson(response);
        return deleteGarageResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while deleting garage $e",
          tag: "GarageDataSourceImpl");
      return DeleteGarageResponseEntity(success: false, message: e.toString());
    }
    return DeleteGarageResponseEntity(
        success: false, message: "Unable to delete your garage");
  }

  @override
  Future<GetMyCarResponseEntity> getMyCars() async {
    try {
      final response = await _dioService.get(endpoint: EndPoints.getMyCars);

      AppLogger.log("Response from getting cars: $response", tag: "getMyCars");

      if (response != null) {
        final getCarResponse = GetMyCarResponseEntity.fromJson(response);
        return getCarResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting cars $e",
          tag: "GarageDataSourceImpl");
      return GetMyCarResponseEntity(
          success: false, message: e.toString(), myCars: []);
    }
    return GetMyCarResponseEntity(
        success: false, message: "Unable to delete your garage", myCars: []);
  }

  @override
  Future<GetMyGarageResponseEntity> getMyGarage() async {
    try {
      final response = await _dioService.get(endpoint: EndPoints.getMyGarage);

      AppLogger.log("Response from getting garage: $response",
          tag: "getMyGarage");

      if (response != null) {
        final getGarageResponse = GetMyGarageResponseEntity.fromJson(response);
        final user = _userService.currentUser!
            .copyWith(garage: getGarageResponse.garage);
        _userService.setCurrentUser(user);

        AppLogger.log(
            "New User from getting my garage: ${_userService.currentUser}",
            tag: "GarageDataSourceImpl");

        return getGarageResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting cars $e",
          tag: "GarageDataSourceImpl");
      return GetMyGarageResponseEntity(
          success: false, message: e.toString(), garage: null);
    }
    return GetMyGarageResponseEntity(
        success: false, message: "Unable to delete your garage", garage: null);
  }
}
