import 'package:flutter/material.dart';

class TrafficLawsPage extends StatefulWidget {
  const TrafficLawsPage({super.key});

  @override
  State<TrafficLawsPage> createState() => _TrafficLawsPageState();
}

class _TrafficLawsPageState extends State<TrafficLawsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          iconTheme: const IconThemeData(color: Colors.white),
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
                    hintText: 'type here',
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Trigger search based on the entered text
                          print("Search button pressed");
                          print(controller.text);
                          // Add your search logic here
                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String recent = 'Law $index';
                    return ListTile(
                      title: Text(recent),
                      onTap: () {
                        controller.closeView(recent);
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
