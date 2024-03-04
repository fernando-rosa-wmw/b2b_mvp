class AuthModel {
  final String? email;
  final String? password;

  AuthModel([this.email, this.password]);

  AuthModel copyWith({
    String? email,
    String? password,
  }) {
    return AuthModel(
      email ?? this.email,
      password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'AuthModel{email: $email, password: $password}';
  }
}
