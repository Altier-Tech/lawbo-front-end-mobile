import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<dynamic> search(String keyword) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/search?query=$keyword'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('API Error: ${response.statusCode} - ${response.reasonPhrase}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('API Error: $e');
      throw Exception('Failed to load data');
    }
  }
}
