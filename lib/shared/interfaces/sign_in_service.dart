import 'package:b2b_mvp/shared/models/auth_model.dart';

abstract class SignInService {
  Future<AuthModel> handleSignIn();
  void handleSignOut();
}