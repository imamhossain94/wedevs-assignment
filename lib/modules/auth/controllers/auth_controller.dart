import 'dart:convert';

import 'package:dokan/app/routes.dart';
import 'package:dokan/core/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:dokan/core/services/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  var isLoading = false.obs;

  Future<void> signUp(String username, String email, String password) async {
    isLoading.value = true;
    try {
      final response = await _apiService.post('wp/v2/users/register', {
        'username': username,
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final message = json.decode(response.body)['message'];
        Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
        // Handle success
      } else {
        final message = json.decode(response.body)['message'];
        Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
        // Handle error
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "An error occurred: $e", toastLength: Toast.LENGTH_SHORT);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await _apiService.post('jwt-auth/v1/token', {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        final authToken = json.decode(response.body)['token'];
        setAuthToken(authToken);
        Fluttertoast.showToast(msg: "Login successful", toastLength: Toast.LENGTH_SHORT);

        Get.offNamed(AppRoutes.BASE);
        // Handle success
      } else {
        final message = json.decode(response.body)['message'];
        Fluttertoast.showToast(msg: "Login failed: $message", toastLength: Toast.LENGTH_SHORT);
        // Handle error
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "An error occurred: $e", toastLength: Toast.LENGTH_SHORT);
    } finally {
      isLoading.value = false;
    }
  }
}
