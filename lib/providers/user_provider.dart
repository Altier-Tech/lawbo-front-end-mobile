import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lawbo/screens/home_page.dart';
import 'package:logger/logger.dart';

import '../models/user_model.dart';
import '../screens/auth/sign_in_page.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get userData => _user;

  checkAuthState(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ));
        Logger().e('User is currently signed out!');
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
        Logger().i('User is signed in!--- ');
      }
    });
  }
}
