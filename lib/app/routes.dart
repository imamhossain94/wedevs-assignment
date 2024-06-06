import 'package:dokan/modules/auth/bindings/auth_binding.dart';
import 'package:dokan/modules/auth/views/login_page.dart';
import 'package:dokan/modules/auth/views/signup_page.dart';
import 'package:dokan/modules/base/bindings/base_binding.dart';
import 'package:dokan/modules/base/views/base_page.dart';
import 'package:dokan/modules/cart/bindings/cart_binding.dart';
import 'package:dokan/modules/cart/views/cart_page.dart';
import 'package:dokan/modules/category/bindings/category_binding.dart';
import 'package:dokan/modules/category/views/category_page.dart';
import 'package:dokan/modules/explore/bindings/explore_binding.dart';
import 'package:dokan/modules/explore/views/search_page.dart';
import 'package:dokan/modules/home/bindings/home_binding.dart';
import 'package:dokan/modules/home/views/home_page.dart';
import 'package:dokan/modules/profile/bindings/profile_binding.dart';
import 'package:dokan/modules/profile/views/profile_page.dart';
import 'package:get/get.dart';


class AppRoutes {
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const BASE = '/';
  static const HOME = '/home';
  static const CATEGORY = '/category';
  static const SEARCH = '/search';
  static const CART = '/cart';
  static const PROFILE = '/profile';
}

class AppPages {
  static const INITIAL = AppRoutes.HOME;
  static final pages = [
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.SIGNUP, page: () => SignupPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.BASE, page: () => BasePage(), binding: BaseBinding()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.CATEGORY, page: () => CategoryPage(), binding: CategoryBinding()),
    GetPage(name: AppRoutes.SEARCH, page: () => ExplorePage(), binding: ExploreBinding()),
    GetPage(name: AppRoutes.CART, page: () => CartPage(), binding: CartBinding()),
    GetPage(name: AppRoutes.PROFILE, page: () => ProfilePage(), binding: ProfileBinding()),
  ];
}
