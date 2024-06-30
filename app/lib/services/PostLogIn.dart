import 'dart:convert';

import 'package:app/models/User.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final String baseUrl = 'https://4d36-197-43-81-117.ngrok-free.app/api';


  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return User.fromJson(jsonResponse['user']);
    } else {
      throw Exception('Failed to login ');
    }
  }
}