import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controllers/auth_controlller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthController.checkAuthState(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "lib/assets/logo.png",
              width: size.width * 0.5,
              height: size.height * 0.5,
            ),
          ),
          const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: CupertinoActivityIndicator(
                  radius: 15,
                ),
              ))
        ],
      ),
    );
  }
}
