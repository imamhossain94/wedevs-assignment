import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'http://apptest.dokandemo.com/wp-json/';

  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(url, body: data);
    return response;
  }

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(url);
    return response;
  }
}
