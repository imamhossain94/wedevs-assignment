import 'package:get/get.dart';
import 'package:dokan/data/models/product.dart';
import 'package:dokan/data/repositories/local_data_repository.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;
  final LocalDataRepository _localDataRepository = Get.find<LocalDataRepository>();

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  Future<void> loadProducts() async {
    products.value = await _localDataRepository.loadProducts();
  }
}
