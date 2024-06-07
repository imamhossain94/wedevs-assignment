import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:dokan/modules/base/controllers/base_controller.dart';
import 'package:dokan/modules/category/views/category_page.dart';
import 'package:dokan/modules/explore/views/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/home/views/home_page.dart';
import 'package:dokan/modules/cart/views/cart_page.dart';
import 'package:dokan/modules/profile/views/profile_page.dart';

class BasePage extends GetView<BaseController> {
  const BasePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      floatingActionButton: Container(
        height: 46.sp,
        width: 46.sp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.sp),
          gradient: const LinearGradient(
            colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
          ),
        ),
        child: FloatingActionButton(
          elevation: 0,
          highlightElevation: 0.0,
          splashColor: Colors.transparent,
          shape: const CircleBorder(),
          onPressed: () => controller.onItemTapped(4),
          backgroundColor: Colors.transparent,
          child: DokanIcon.icon(DokanIcon.search, size: 20.sp, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 56.h,
        child: Obx(()=> BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IconButton(
                icon: DokanIcon.icon(DokanIcon.home, size: 18.sp, color: color(0)),
                onPressed: () => controller.onItemTapped(0),
              ),
              IconButton(
                icon: DokanIcon.icon(DokanIcon.grid, size: 18.sp, color: color(1)),
                onPressed: () => controller.onItemTapped(1),
              ),
              SizedBox(width: 18.sp,),
              IconButton(
                icon: DokanIcon.icon(DokanIcon.cart, size: 18.sp, color: color(2)),
                onPressed: () => controller.onItemTapped(2),
              ),
              IconButton(
                icon: DokanIcon.icon(DokanIcon.user, size: 18.sp, color: color(3)),
                onPressed: () => controller.onItemTapped(3),
              ),
            ],
          ),
        )),
      ),
    );

  }

  Widget getBody() {
    List<Widget> pages = [
      const HomePage(),
      const CategoryPage(),
      const CartPage(),
      ProfilePage(),
      const ExplorePage(),
    ];
    return Obx(() => IndexedStack(
      index: controller.selectedIndex.value,
      children: pages,
    ));
  }

  Color color(int index) {
    return controller.selectedIndex.value == index
        ? const Color(0xFFFF679B)
        : const Color(0xFF6E7FAA);
  }

}
