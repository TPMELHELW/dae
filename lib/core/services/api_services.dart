import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  final http.Client client;

  ApiClient({required this.client});

  Future<dynamic> get(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('API Error: ${response.statusCode}');
    }
  }
}
