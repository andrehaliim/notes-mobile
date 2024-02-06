import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notes_app/config.dart';
class LoginApi {
  Future<Map<String, dynamic>> login(String username, String password) async {
    const String url = 'https://andrehaliim.000webhostapp.com/api/auth/login';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    final Map<String, String> body = {
      'username': username,
      'password': password,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    print(url);
    print(response.body);

    final Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  Future<String> logout(ConfigModel configModel) async {
    const String url = 'https://andrehaliim.000webhostapp.com/api/auth/logout';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${configModel.token}'
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(url);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      configModel.token = '';
      return data['message'];
    } else if (response.statusCode == 401) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['message'];
    } else {
      throw Exception('Failed to logout');
    }
  }
}


