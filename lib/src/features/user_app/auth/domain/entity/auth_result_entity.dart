class UserRegistrationEntity {
  final bool success;
  final String message;
  final String activationToken;

  const UserRegistrationEntity({
    required this.success,
    required this.message,
    required this.activationToken,
  });
}
