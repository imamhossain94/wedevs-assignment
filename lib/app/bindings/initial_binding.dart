import 'package:dokan/core/services/api_service.dart';
import 'package:dokan/data/repositories/local_data_repository.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<LocalDataRepository>(() => LocalDataRepository());
  }
}
