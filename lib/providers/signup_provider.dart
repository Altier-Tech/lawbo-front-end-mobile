import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../controllers/auth_controlller.dart';

class SignUpProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get nameController => _nameController;

  Future<void> signUpUser() async {
    if (_emailController.text.isEmpty) {
      Logger().e("Please Insert Your Email");
    } else if (_passwordController.text.isEmpty) {
      Logger().e("Please Insert Your Password");
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Logger().e("Check Your Password");
    } else if (_nameController.text.isEmpty) {
      Logger().e("Please enter your name");
    } else {
      AuthController()
          .createUserAccount(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      )
          .then((value) {
        clearTextField();
      });
    }
  }

  void clearTextField() {
    _emailController.text = "";
    _passwordController.text = "";
    _confirmPasswordController.text = "";
  }
}
