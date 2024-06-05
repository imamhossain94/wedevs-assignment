import 'package:dokan/modules/cart/controllers/cart_controller.dart';
import 'package:dokan/modules/category/controllers/category_controller.dart';
import 'package:dokan/modules/explore/controllers/explore_controller.dart';
import 'package:dokan/modules/home/controllers/home_controller.dart';
import 'package:dokan/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/base/controllers/base_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<ExploreController>(() => ExploreController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
