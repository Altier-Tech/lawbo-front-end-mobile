import 'package:flutter/material.dart';
import 'package:lawbo/custom-widgets/custom_container.dart';

import '../../custom-widgets/custom_text.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<String> laws = [
    "No Helmot",
    "No Liscence & Insurance",
    "Using mobile phone while driving",
    "Cutting the doube lines",
    "High speed driving",
    "No driving liscence"
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
                  text: "We are provide some key laws:",
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
                  child: CustomContainer(
                    width: size.width * 0.2,
                    height: size.height * 0.08,
                    color: Colors.amber.shade200,
                    text: laws[index],
                    ontap: () {},
                    fsize: 18,
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
