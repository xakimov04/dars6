import 'package:dars6/models/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static const String _baseUrl = 'https://api.escuelajs.co/api/v1/users';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }
}
