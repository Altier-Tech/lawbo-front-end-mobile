import 'package:flutter/material.dart';

import '../../Services/api_service.dart';

class CriminalLawsPage extends StatefulWidget {
  const CriminalLawsPage({Key? key}) : super(key: key);

  @override
  State<CriminalLawsPage> createState() => _CriminalLawsPageState();
}

class _CriminalLawsPageState extends State<CriminalLawsPage> {
  final ApiService apiService =
      ApiService(baseUrl: 'http://localhost:5000/search');
  List<String> previousTexts = [];
  List<String> currentSuggestions = [];
  String? searchResult; // Store the search result
  String? errorMessage; // Store any error messages
  String currentSearchText = ''; // Store the current text in the search bar

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
                    onChanged: (text) {
                      // Update the current search text
                      print('Current Text Changed: $text');
                      setState(() {
                        currentSearchText = text ?? '';
                      });

                      controller.openView();
                      // Update suggestions based on the current input
                      setState(() {
                        // Filter previousTexts based on the current input
                        currentSuggestions = previousTexts
                            .where((text) => text
                                .toLowerCase()
                                .contains(currentSearchText.toLowerCase()))
                            .toList();
                      });
                    },
                    leading: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    trailing: <Widget>[
                      TextButton(
                        onPressed: () async {
                          // Trigger search based on the entered text
                          // Add your search logic here
                          if (!previousTexts.contains(currentSearchText)) {
                            previousTexts.add(currentSearchText);
                            // Call the API and update the search result
                            try {
                              final result =
                                  await apiService.search(currentSearchText);
                              print(
                                  'API Response: $result'); // Print the API response
                              setState(() {
                                searchResult = result['result'];
                                errorMessage =
                                    null; // Reset error message if successful
                              });
                            } catch (e) {
                              // Handle API errors
                              print('API Error: $e');
                              setState(() {
                                errorMessage =
                                    'Failed to fetch data. Please try again.';
                                searchResult =
                                    null; // Reset search result on error
                              });
                            }
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
            // Display the search result or error message
            if (searchResult != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Search Result: $searchResult',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error: $errorMessage',
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
