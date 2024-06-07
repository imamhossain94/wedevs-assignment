import 'dart:convert';

import 'package:dokan/core/services/api_service.dart';
import 'package:dokan/core/services/storage_service.dart';
import 'package:dokan/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var user = User().obs;
  final ApiService _apiService = Get.find<ApiService>();
  var isLoading = false.obs;
  final fullNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    final token = getAuthToken();
    if (token == null) {
      Fluttertoast.showToast(msg: "Authentication token is missing", toastLength: Toast.LENGTH_SHORT);
      return;
    }

    isLoading.value = true;
    try {
      final response = await _apiService.getWithToken('wp/v2/users/me?context=edit', token);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var userData = userFromJson(jsonString);
        user.value = userData;
        fullNameController.value.text = userData.fullName();
        emailController.value.text = userData.email.toString();
      } else {
        final message = json.decode(response.body)['message'];
        Fluttertoast.showToast(msg: "Failed to fetch user details: $message", toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "An error occurred: $e", toastLength: Toast.LENGTH_SHORT);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUser(int id, Map<String, String> data) async {
    final token = getAuthToken();
    if (token == null) {
      Fluttertoast.showToast(msg: "Authentication token is missing", toastLength: Toast.LENGTH_SHORT);
      return;
    }

    isLoading.value = true;
    try {
      final response = await _apiService.postWithToken('wp/v2/users/$id', token, data);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        user.value = userFromJson(jsonString);
        Fluttertoast.showToast(msg: "User updated successfully", toastLength: Toast.LENGTH_SHORT);
      } else {
        final message = json.decode(response.body)['message'];
        Fluttertoast.showToast(msg: "Failed to update user: $message", toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "An error occurred: $e", toastLength: Toast.LENGTH_SHORT);
    } finally {
      isLoading.value = false;
    }
  }
}
