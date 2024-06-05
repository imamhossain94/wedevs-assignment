import 'package:get/get.dart';
import 'package:dokan/core/services/api_service.dart';

class AuthController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();

  Future<void> signUp(String username, String email, String password) async {
    final response = await _apiService.post('wp/v2/users/register', {
      'username': username,
      'email': email,
      'password': password,
    });

    if (response.statusCode == 201) {
      // Handle success
    } else {
      // Handle error
    }
  }

  Future<void> login(String username, String password) async {
    final response = await _apiService.post('jwt-auth/v1/token', {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle error
    }
  }
}
