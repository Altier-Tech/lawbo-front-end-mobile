import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../custom-widgets/auth_background.dart';
import '../../custom-widgets/circular_indicator.dart';
import '../../custom-widgets/custom_button.dart';
import '../../custom-widgets/custom_text.dart';
import '../../custom-widgets/custom_textfield.dart';
import '../../providers/signin_provider.dart';
import 'forgotpwd_page.dart';
import 'signup_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: SafeArea(
        child: Scaffold(body: Consumer<SignInProvider>(
          builder: (BuildContext context, value, child) {
            return AuthBackground(
              size: size,
              text1: "Sign In",
              content: ListView(
                children: [
                  CustomTextField(
                    isPassword: false,
                    label: 'Email',
                    controller: value.emailController,
                    prefix: Icons.email_outlined,
                  ),
                  CustomTextField(
                    label: "Password",
                    controller: value.passwordController,
                    prefix: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularIndicator(isVisible: true),
                            );
                          },
                        );
                        Future.delayed(
                          const Duration(seconds: 3),
                          () {
                            CircularIndicator(isVisible: false);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ));
                          },
                        );
                      },
                      child: CustomPoppinsText(
                          text: "Forgot password?",
                          color: Colors.black,
                          fsize: 18,
                          fweight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    size: size,
                    ontap: () {
                      Provider.of<SignInProvider>(context, listen: false)
                          .signInUser(context);
                    },
                    text: "Sign In",
                    buttonColor: Colors.amber,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPoppinsText(
                          text: "Don't have an account?",
                          color: Colors.black,
                          fsize: 16,
                          fweight: FontWeight.w500),
                      GestureDetector(
                        child: CustomPoppinsText(
                            text: "  Sign Up",
                            color: Colors.black,
                            fsize: 18,
                            fweight: FontWeight.bold),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularIndicator(isVisible: true),
                              );
                            },
                          );
                          Future.delayed(
                            const Duration(seconds: 3),
                            () {
                              CircularIndicator(isVisible: false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      )),
                      CustomPoppinsText(
                          text: "  Or login with  ",
                          color: Colors.black,
                          fsize: 16,
                          fweight: FontWeight.w500),
                      const Expanded(
                          child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<SignInProvider>(context, listen: false)
                          .signInWithGoogle();
                    },
                    child: Container(
                      height: 40,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Colors.amber.shade300,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //const Icon(Icons.mail),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                  image: AssetImage('lib/assets/google.png'),
                                  width: 30),
                            ),
                            CustomPoppinsText(
                                text: " Continue with google",
                                color: Colors.black,
                                fsize: 16,
                                fweight: FontWeight.w600)
                          ]),
                    ),
                  )
                ],
              ),
              text2: 'Enter your details below & free log in',
            );
          },
        )),
      ),
    );
  }
}
