import 'package:flutter/material.dart';
import 'package:lawbo/custom-widgets/circular_indicator.dart';
import 'package:lawbo/custom-widgets/custom_container.dart';
import 'package:lawbo/custom-widgets/custom_text.dart';
import 'package:lawbo/screens/laws%20pages/criminal_laws.dart';
import 'package:lawbo/screens/laws%20pages/traffic_laws.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade900,
        title: Center(
          child: CustomPoppinsText(
              text: "LawBo",
              color: Colors.white,
              fsize: 30,
              fweight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainer(
              width: size.width * 0.4,
              height: size.width * 0.4,
              color: Colors.purpleAccent,
              text: "Traffic laws",
              ontap: () {
                Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrafficLawsPage(),
                        ));
                    CircularIndicator(isVisible: false);
                  },
                );
              },
            ),
            const SizedBox(
              width: 5,
            ),
            CustomContainer(
              width: size.width * 0.4,
              height: size.width * 0.4,
              color: Colors.purpleAccent,
              text: "Criminal laws",
              ontap: () {
                CircularIndicator(isVisible: true);

                Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CriminalLawsPage(),
                        ));
                    CircularIndicator(isVisible: false);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
