import 'package:flutter/material.dart';
import 'package:lawbo/custom-widgets/custom_text.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.text,
      required this.ontap});

  double width;
  double height;
  Color color;
  String text;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(10)),
        ),
        child: Center(
          child: CustomPoppinsText(
              text: text,
              color: Colors.white,
              fsize: 20,
              fweight: FontWeight.w500),
        ),
      ),
    );
  }
}
