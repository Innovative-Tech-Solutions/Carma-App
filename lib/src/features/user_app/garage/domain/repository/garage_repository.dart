import 'package:carma_app/src/core/errors/failure.dart';

import 'package:carma_app/src/features/user_app/garage/data/model/add_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/data/model/delete_car_params.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/add_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/delete_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/delete_garage_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/garage_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/get_my_car_response_entity.dart';
import 'package:carma_app/src/features/user_app/garage/domain/entity/get_my_garage_response_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class GarageRepository {
  Future<Either<Failure, GarageResponse>> createGarage(String nameOfGarage);
  Future<Either<Failure, DeleteGarageResponseEntity>> deleteGarage(
      String garageId);
  Future<Either<Failure, AddCarResponseEntity>> addCar(AddCarParams car);
  Future<Either<Failure, DeleteCarResponseEntity>> deleteCar(
      DeleteCarParams car);
  Future<Either<Failure, GetMyGarageResponseEntity>> getMyGarage();
  Future<Either<Failure, GetMyCarResponseEntity>> getMyCars();
}
