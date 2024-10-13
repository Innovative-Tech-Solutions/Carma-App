import 'package:carma_app/src/core/constants/endpoints.dart';
import 'package:carma_app/src/core/model/user_data.dart';
import 'package:carma_app/src/core/services/dio_service.dart';
import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/features/user_app/user/data/model/get_user_info_response.dart';
import 'package:carma_app/src/features/user_app/user/data/model/update_avatar_response.dart';
import 'package:carma_app/src/features/user_app/user/data/model/update_user_info_response.dart';
import 'package:carma_app/src/features/user_app/user/domain/entity/update_info_entity.dart';

abstract interface class UserDatasource {
  Future<GetUserInfoResponse> getUserInfo();

  Future<UpdateInfoResponse> updateInfo(UpdateInfoEntity userInfo);

  Future<UpdateAvatarResponse> updateAvatar();
}

class UserDataSourceImpl extends UserDatasource {
  final DioService _dioService;
  final UserService _userService;

  UserDataSourceImpl({
    required DioService dioService,
    required UserService userService,
  })  : _dioService = dioService,
        _userService = userService;

  @override
  Future<GetUserInfoResponse> getUserInfo() async {
    try {
      final response = await _dioService.get(endpoint: EndPoints.getUserInfo);

      AppLogger.log("Response from getting user info: $response",
          tag: "getUserInfo");

      if (response != null) {
        final getNotificationsResponse = GetUserInfoResponse.fromJson(response);
        if (getNotificationsResponse.success) {
          final UserData? userFromGet = getNotificationsResponse.user;
          final userData = _userService.currentUser!.copyWith(
            subscription: userFromGet?.subscription,
            id: userFromGet?.id,
            name: userFromGet?.name,
            email: userFromGet?.email,
            role: userFromGet?.role,
            isVerified: userFromGet?.isVerified,
            isOnline: userFromGet?.isOnline,
            courses: userFromGet?.courses,
            createdAt: userFromGet?.createdAt,
            updatedAt: userFromGet?.updatedAt,
          );

          await _userService.setCurrentUser(userData);
          AppLogger.log("User after registration: ${_userService.currentUser}",
              tag: "registerUser");
        }
        return getNotificationsResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting user info $e",
          tag: "UserDataSourceImpl");
      return GetUserInfoResponse(
          success: false, message: e.toString(), user: null);
    }
    return GetUserInfoResponse(
        success: false,
        message: "Unable to get your notifications",
        user: null);
  }

  @override
  Future<UpdateAvatarResponse> updateAvatar() {
    // TODO: implement updateAvatar
    throw UnimplementedError();
  }

  @override
  Future<UpdateInfoResponse> updateInfo(UpdateInfoEntity userInfo) async {
    try {
      final response = await _dioService.put(
          endpoint: EndPoints.updateUserInfo, data: userInfo.toJson());

      AppLogger.log("Response from updating user info: $response",
          tag: "updateInfo");

      if (response != null) {
        final updateNotificationsResponse =
            UpdateInfoResponse.fromJson(response);
        if (updateNotificationsResponse.success) {
          final UserData? userFromGet = updateNotificationsResponse.user;
          final userData = _userService.currentUser!.copyWith(
            subscription: userFromGet?.subscription,
            id: userFromGet?.id,
            name: userFromGet?.name,
            email: userFromGet?.email,
            role: userFromGet?.role,
            isVerified: userFromGet?.isVerified,
            isOnline: userFromGet?.isOnline,
            courses: userFromGet?.courses,
            createdAt: userFromGet?.createdAt,
            updatedAt: userFromGet?.updatedAt,
          );

          await _userService.setCurrentUser(userData);
          AppLogger.log("User after registration: ${_userService.currentUser}",
              tag: "registerUser");
        }
        return updateNotificationsResponse;
      }
    } catch (e) {
      AppLogger.logError("Error while getting user info $e",
          tag: "UserDataSourceImpl");
      return UpdateInfoResponse(
          success: false, message: e.toString(), user: null);
    }
    return UpdateInfoResponse(
        success: false,
        message: "Unable to get your notifications",
        user: null);
  }
}
