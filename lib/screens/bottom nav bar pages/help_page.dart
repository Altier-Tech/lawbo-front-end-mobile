import 'package:flutter/material.dart';
import 'package:lawbo/custom-widgets/custom_container.dart';

import '../../custom-widgets/circular_indicator.dart';
import '../../custom-widgets/custom_text.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<String> laws = [
    "Driving under age children",
    "Errors related to speed",
    "Offenses relating to railways",
    "Driving while using mobile phones",
    "Minimum fine",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Center(
          child: CustomPoppinsText(
              text: "LawBo",
              color: Colors.black,
              fsize: 30,
              fweight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
            child: Center(
              child: CustomPoppinsText(
                  text: "You can use these key words:",
                  color: Colors.black,
                  fsize: 20,
                  fweight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 4, top: 4),
                  child: GestureDetector(
                    child: CustomContainer(
                      width: size.width * 0.2,
                      height: size.height * 0.1,
                      color: Colors.amber.shade200,
                      text: laws[index],
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
                          const Duration(seconds: 2),
                          () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.grey,
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: CustomPoppinsText(
                                      text: laws[index],
                                      color: Colors.black,
                                      fsize: 20,
                                      fweight: FontWeight.w700),
                                  content: CustomPoppinsText(
                                      text:
                                          'In this modified version, I added a currentSuggestions list to store the suggestions dynamically based on the current input. ',
                                      color: Colors.black,
                                      fsize: 16,
                                      fweight: FontWeight.w500),
                                  scrollable: true,
                                );
                              },
                            );
                          },
                        );
                      },
                      fsize: 18,
                    ),
                  ),
                );
              },
              itemCount: laws.length,
            ),
          ),
        ],
      ),
    );
  }
}
