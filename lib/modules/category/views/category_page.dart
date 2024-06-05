import 'package:dokan/modules/category/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends GetView<CategoryController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category')),
      body: Center(
        child: Text('Category Page'),
      ),
    );
  }
}
