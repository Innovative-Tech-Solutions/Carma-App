class LoginParamsModel {
  final String password;
  final String email;

  LoginParamsModel({
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParamsModel.fromJson(Map<String, dynamic> map) {
    return LoginParamsModel(
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }
}
