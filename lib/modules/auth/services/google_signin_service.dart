import 'dart:async';

import 'package:b2b_mvp/shared/interfaces/sign_in_service.dart';
import 'package:b2b_mvp/shared/models/auth_model.dart';
import 'package:b2b_mvp/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class GoogleSignInService implements SignInService {
  late UserModel user;

  static const List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: scopes,
  );

  @override
  Future<AuthModel> handleSignIn() async {
    AuthModel authModel = AuthModel('empty', 'empty');
    try {
      OAuthCredential credential;
      // if (credential == null) {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        Logger().i('credential ${credential.toString()}');

        // }
        UserCredential user =
            await FirebaseAuth.instance.signInWithCredential(credential);

        Logger().i('userFirebase ${user.toString()}');

        authModel = AuthModel(user.user?.email, user.user?.displayName);

        Logger().i('authModel ${authModel.toString()}');
        return authModel;
      }
    } catch (e) {
      Logger().e(e);
      return authModel;
    }

    return authModel;
  }
}
