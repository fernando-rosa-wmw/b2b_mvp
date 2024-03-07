import 'package:b2b_mvp/shared/data/hive_types.dart';
import 'package:hive/hive.dart';

part 'auth_model.g.dart';

@HiveType(typeId: 30)
class AuthModel {
  @HiveField(0)
  final String? email;
  @HiveField(1)
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
