import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawbo/controllers/auth_controlller.dart';
import 'package:lawbo/controllers/storage_controller.dart';
import 'package:lawbo/providers/profile_provider.dart';
import 'package:lawbo/screens/main%20screen/main_screen.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../screens/auth/sign_in_page.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get userData => _user;
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  ImagePicker picker = ImagePicker();
  File _image = File("");
  File get image => _image;

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
        fetchData(user.uid, context).then(
          (value) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ));
            Logger().i('User is signed in!--- ');
          },
        );
      }
    });
  }

  Future<void> fetchData(uid, context) async {
    _user = await AuthController().getUserData(uid);
    
    Provider.of<ProfileProvider>(context, listen: false)
        .setUserName(_user!.name);
    notifyListeners();
  }

  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  Future<void> updateProfileData(BuildContext context) async {
    //CustomDialog.show(context);
    if (_image.path != "") {
      String imageUrl =
          await StorageController().uploadImage(_image, "User Images");
      users.doc(_user!.uid).update(
          {"name": _nameController.text, "userImage": imageUrl}).then((value) {
        //CustomDialog.toast(context, "User Updated");
        //CustomDialog.dismiss(context);
      });
    } else {
      users
          .doc(_user!.uid)
          .update({"name": _nameController.text}).then((value) {
        //CustomDialog.dismiss(context);
        //CustomDialog.toast(context, "User Updated");
      });
    }
  }

  void setUserName(String name) {
    _nameController.text = name;
    notifyListeners();
  }

  Future<void> pickImage() async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      notifyListeners();
      Logger().i(_image.path);
    } else {
      Logger().e("Try again");
    }
  }
}
