import 'package:dars6/services/category_http_service.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  void fetchCategories() async {
    _isLoading = true;
    _categories = await CategoryService().fetchCategories();
    _isLoading = false;
    notifyListeners();
  }
}
