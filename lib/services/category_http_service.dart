import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryService {
  static const String _url = 'https://api.escuelajs.co/api/v1/categories';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Category.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
