import 'package:flutter/material.dart';
import 'package:lawbo/controllers/auth_controlller.dart';
import 'package:lawbo/custom-widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../custom-widgets/custom_button.dart';
import '../../providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserProvider>(context).userData;
    final userName = userData?.name ?? 'Team Astronauts';
    final size = MediaQuery.of(context).size;

    return SafeArea(child: Consumer(
      builder: (context, value, child) {
        return Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.25,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                          backgroundImage:
                              //NetworkImage(value.userData!.userImage),
                              AssetImage('lib/assets/profile.png'),
                          radius: 35),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomPoppinsText(
                            // text: Provider.of<UserProvider>(context)
                            //     .userData!
                            //     .email,
                            text: userName,
                            color: Colors.black,
                            fsize: 20,
                            fweight: FontWeight.w600),
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
                                fweight: FontWeight.w600),
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
                                fweight: FontWeight.w600),
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
                        padding: const EdgeInsets.all(20.0),
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
                            text: "Sign Out",
                            buttonColor: Colors.amber,
                            textColor: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
