class SignUpParamsModel {
  final String name;
  final String password;
  final String email;

  SignUpParamsModel({
    required this.name,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory SignUpParamsModel.fromJson(Map<String, dynamic> map) {
    return SignUpParamsModel(
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  @override
  String toString() =>
      'SignUpParamsModel(name: $name, password: $password, email: $email)';
}
