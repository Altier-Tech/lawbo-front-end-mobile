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
        backgroundColor: Colors.amber,
        title: CustomPoppinsText(
            text: "LawBo",
            color: Colors.black,
            fsize: 25,
            fweight: FontWeight.w600),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomPoppinsText(
                  text: "You can use ky words from help page also:",
                  color: Colors.black,
                  fsize: 20,
                  fweight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainer(
                  width: size.width * 0.45,
                  height: size.width * 0.45,
                  color: Colors.amber.shade400,
                  text: "Traffic laws",
                  ontap: () {
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
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TrafficLawsPage(),
                            ));
                      },
                    );
                  },
                  fsize: 23,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomContainer(
                  width: size.width * 0.45,
                  height: size.width * 0.45,
                  color: Colors.amber.shade400,
                  text: "Criminal laws",
                  ontap: () {
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
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CriminalLawsPage(),
                            ));
                      },
                    );
                  },
                  fsize: 23,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
