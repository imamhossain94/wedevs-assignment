import 'package:dokan/modules/base/controllers/base_controller.dart';
import 'package:dokan/modules/category/views/category_page.dart';
import 'package:dokan/modules/explore/views/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/home/views/home_page.dart';
import 'package:dokan/modules/cart/views/cart_page.dart';
import 'package:dokan/modules/profile/views/profile_page.dart';

class BasePage extends GetView<BaseController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return HomePage();
          case 1:
            return CategoryPage();
          case 2:
            return ExplorePage();
          case 3:
            return CartPage();
          case 4:
            return ProfilePage();
          default:
            return HomePage();
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      }),
    );
  }
}
