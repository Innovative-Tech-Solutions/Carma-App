import 'package:carma_app/src/core/errors/failure.dart';
import 'package:carma_app/src/core/utils/base_repo_impl.dart';
import 'package:carma_app/src/features/user_app/user/data/datasource/user_datasource.dart';
import 'package:carma_app/src/features/user_app/user/data/model/get_user_info_response.dart';
import 'package:carma_app/src/features/user_app/user/data/model/update_avatar_response.dart';
import 'package:carma_app/src/features/user_app/user/data/model/update_user_info_response.dart';
import 'package:carma_app/src/features/user_app/user/domain/entity/update_info_entity.dart';
import 'package:carma_app/src/features/user_app/user/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserRepoImpl extends UserRepository with RepositoryErrorHandler {
  final UserDatasource _userDataSource;

  UserRepoImpl({
    required UserDatasource authDataSource,
  }) : _userDataSource = authDataSource;

  @override
  Future<Either<Failure, GetUserInfoResponse>> getUserInfo() async {
    return callAction(() => _userDataSource.getUserInfo());
  }

  @override
  Future<Either<Failure, UpdateAvatarResponse>> updateAvatar() {
    // TODO: implement updateAvatar
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UpdateInfoResponse>> updateInfo(
      UpdateInfoEntity userInfo) async {
    return callAction(() => _userDataSource.updateInfo(userInfo));
  }
}
