import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dokan/data/models/product.dart';

class LocalDataRepository {
  Future<List<Product>> loadProducts() async {
    final String response = await rootBundle.loadString('assets/data/response.json');
    final data = await json.decode(response) as List;
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
