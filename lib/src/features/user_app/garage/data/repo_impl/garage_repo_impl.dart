import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/core/utils/base_repo_impl.dart';
import 'package:carma_app/src/features/user_app/garage/data/datasource/garage_datasource.dart';
import 'package:carma_app/src/features/user_app/garage/data/model/add_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/data/model/delete_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/add_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/delete_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/delete_garage_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/garage_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/get_my_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/get_my_garage_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/repository/garage_repository.dart';
import 'package:fpdart/src/either.dart';

class GarageRepoImpl extends GarageRepository with RepositoryErrorHandler {
  final GarageDatasource _garageDatasource;
  GarageRepoImpl({required GarageDatasource garageDatasource})
      : _garageDatasource = garageDatasource;

  @override
  Future<Either<Failure, AddCarResponseEntity>> addCar(AddCarParams car) async {
    return callAction(() => _garageDatasource.addCar(car));
  }

  @override
  Future<Either<Failure, GarageResponse>> createGarage(
      String nameOfGarage) async {
    return callAction(() => _garageDatasource.createGarage(nameOfGarage));
  }

  @override
  Future<Either<Failure, DeleteCarResponseEntity>> deleteCar(
      DeleteCarParams car) async {
    return callAction(() => _garageDatasource.deleteCar(car));
  }

  @override
  Future<Either<Failure, DeleteGarageResponseEntity>> deleteGarage(
      String garageId) async {
    return callAction(() => _garageDatasource.deleteGarage(garageId));
  }

  @override
  Future<Either<Failure, GetMyCarResponseEntity>> getMyCars() async {
    return callAction(() => _garageDatasource.getMyCars());
  }

  @override
  Future<Either<Failure, GetMyGarageResponseEntity>> getMyGarage() async {
    return callAction(() => _garageDatasource.getMyGarage());
  }
}
