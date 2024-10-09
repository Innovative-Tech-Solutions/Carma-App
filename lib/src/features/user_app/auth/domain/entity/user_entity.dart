// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String? email;
  final String? userId;
  final String? fullName;

  const UserEntity({
    this.email,
    this.fullName,
    this.userId,
  });

  @override
  String toString() =>
      'UserEntity(email: $email, userId: $userId, fullName: $fullName)';
}
