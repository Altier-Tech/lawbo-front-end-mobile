import 'package:flutter/material.dart';

class CriminalLawsPage extends StatelessWidget {
  const CriminalLawsPage({super.key});

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
