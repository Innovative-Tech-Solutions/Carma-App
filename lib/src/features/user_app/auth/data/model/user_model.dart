import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.userId,
    super.fullName,
  });
}
