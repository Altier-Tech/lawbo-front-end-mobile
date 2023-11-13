import 'package:flutter/material.dart';
import 'package:lawbo/controllers/auth_controlller.dart';
import 'package:lawbo/custom-widgets/custom_button.dart';
import 'package:lawbo/custom-widgets/custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width,
              decoration: BoxDecoration(color: Colors.grey.shade900),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("lib/assets/profile.png"),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomPoppinsText(
                        text: "lawbo@gmail.com",
                        color: Colors.white,
                        fsize: 15,
                        fweight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.8,
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.55,
                    ),
                    CustomButton(
                        size: size,
                        ontap: () {
                          Future.delayed(
                            const Duration(seconds: 3),
                            () {
                              AuthController.signOutUser(context);
                            },
                          );
                        },
                        text: "Log Out",
                        buttonColor: Colors.grey.shade900,
                        textColor: Colors.white)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
