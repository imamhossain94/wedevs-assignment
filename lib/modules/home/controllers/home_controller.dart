import 'package:dokan/core/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:dokan/data/models/product.dart';
import 'package:dokan/data/repositories/local_data_repository.dart';
import 'package:dokan/modules/home/models/filter_option.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var isLoading = false.obs;
  var selectedFilterOption = FilterOption.Newest.obs;
  final LocalDataRepository _localDataRepository = Get.find<LocalDataRepository>();

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  Future<void> loadProducts() async {
    isLoading.value = true;
    products.value = await _localDataRepository.loadProducts();
    selectedFilterOption.value = getCheckedFilter();
    filteredProducts.value = products;
    applyFilter(selectedFilterOption.value);
    isLoading.value = false;
  }

  void applyFilter(FilterOption filterOption) {
    switch (filterOption) {
      case FilterOption.Newest:
        filteredProducts.sort((a, b) => b.dateModified.compareTo(a.dateModified));
        break;
      case FilterOption.Oldest:
        filteredProducts.sort((a, b) => a.dateModified.compareTo(b.dateModified));
        break;
      case FilterOption.PriceLowToHigh:
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case FilterOption.PriceHighToLow:
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case FilterOption.BestSelling:
        filteredProducts.sort((a, b) => b.totalSales.compareTo(a.totalSales));
        break;
    }
  }
}
