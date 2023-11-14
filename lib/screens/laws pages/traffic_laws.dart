// import 'package:flutter/material.dart';

// class TrafficLawsPage extends StatefulWidget {
//   const TrafficLawsPage({super.key});

//   @override
//   State<TrafficLawsPage> createState() => _TrafficLawsPageState();
// }

// class _TrafficLawsPageState extends State<TrafficLawsPage> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.amber,
//           iconTheme: const IconThemeData(color: Colors.black),
//         ),
//         body: Column(
//           children: [
//             SizedBox(
//               height: size.height * 0.25,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SearchAnchor(
//                 builder: (BuildContext context, SearchController controller) {
//                   return SearchBar(
//                     backgroundColor:
//                         MaterialStatePropertyAll(Colors.amber.shade100),
//                     hintText: 'type here',
//                     controller: controller,
//                     padding: const MaterialStatePropertyAll<EdgeInsets>(
//                         EdgeInsets.symmetric(horizontal: 16.0)),
//                     onTap: () {
//                       controller.openView();
//                     },
//                     onChanged: (_) {
//                       controller.openView();
//                     },
//                     leading: const Icon(
//                       Icons.search,
//                       color: Colors.black,
//                     ),
//                     trailing: <Widget>[
//                       TextButton(
//                         onPressed: () {
//                           // Trigger search based on the entered text
//                           print("Search button pressed");
//                           print(controller.text);
//                           // Add your search logic here
//                         },
//                         child: const Text(
//                           'Search',
//                           style: TextStyle(color: Colors.black, fontSize: 18),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//                 suggestionsBuilder:
//                     (BuildContext context, SearchController controller) {
//                   return List<ListTile>.generate(5, (int index) {
//                     final String recent = 'Law $index';
//                     return ListTile(
//                       title: Text(recent),
//                       onTap: () {
//                         controller.closeView(recent);
//                       },
//                     );
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TrafficLawsPage extends StatefulWidget {
  const TrafficLawsPage({Key? key}) : super(key: key);

  @override
  State<TrafficLawsPage> createState() => _TrafficLawsPageState();
}

class _TrafficLawsPageState extends State<TrafficLawsPage> {
  List<String> previousTexts = [];
  List<String> currentSuggestions = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.amber.shade100),
                    hintText: 'type here',
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                      // Update suggestions based on the current input
                      setState(() {
                        // Filter previousTexts based on the current input
                        currentSuggestions = previousTexts
                            .where((text) => text
                                .toLowerCase()
                                .contains(controller.text.toLowerCase()))
                            .toList();
                      });
                    },
                    leading: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    trailing: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Trigger search based on the entered text
                          print("Search button pressed");
                          print(controller.text);
                          // Add your search logic here
                          if (!previousTexts.contains(controller.text)) {
                            previousTexts.add(controller.text);
                          }
                        },
                        child: const Text(
                          'Search',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ],
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(currentSuggestions.length,
                      (int index) {
                    final String suggestion = currentSuggestions[index];
                    return ListTile(
                      title: Text(suggestion),
                      onTap: () {
                        controller.closeView(suggestion);
                      },
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
