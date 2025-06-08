import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://yourserver.com/login'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token']; // JWT token
    } else {
      throw Exception('Login failed');
    }
  }
}
