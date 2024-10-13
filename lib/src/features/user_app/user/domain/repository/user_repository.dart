import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/features/user_app/user/data/model/get_user_info_response.dart';
import 'package:carma_app/src/features/user_app/user/data/model/update_avatar_response.dart';
import 'package:carma_app/src/features/user_app/user/data/model/update_user_info_response.dart';
import 'package:carma_app/src/features/user_app/user/domain/entity/update_info_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  Future<Either<Failure, GetUserInfoResponse>> getUserInfo();

  Future<Either<Failure, UpdateInfoResponse>> updateInfo(
      UpdateInfoEntity userInfo);

  Future<Either<Failure, UpdateAvatarResponse>> updateAvatar();
}
