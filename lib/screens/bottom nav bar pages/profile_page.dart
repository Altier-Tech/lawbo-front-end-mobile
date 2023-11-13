import 'package:flutter/material.dart';
import 'package:lawbo/controllers/auth_controlller.dart';
import 'package:lawbo/custom-widgets/custom_text.dart';

import '../../custom-widgets/custom_button.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: Colors.grey.shade300),
        child: Column(
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
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
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        const Icon(Icons.star),
                        SizedBox(
                          width: size.width * 0.06,
                        ),
                        CustomPoppinsText(
                            text: 'Upgrade to premium',
                            color: Colors.black,
                            fsize: 20,
                            fweight: FontWeight.w500),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        SizedBox(
                          width: size.width * 0.06,
                        ),
                        CustomPoppinsText(
                            text: 'Settings',
                            color: Colors.black,
                            fsize: 20,
                            fweight: FontWeight.w500),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Divider(color: Colors.grey.shade500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
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
                        textColor: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
