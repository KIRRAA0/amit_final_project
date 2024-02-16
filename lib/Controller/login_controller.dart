import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/endpoints.dart';
import '../Model/users_model.dart';

class LoginController extends GetxController {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final RxBool isButtonEnabled = false.obs;

  String token = '';
  String username = '';


  @override
  void onInit() {
    passwordController = TextEditingController();
    emailController = TextEditingController();
    passwordController.addListener(updateButtonState);
    emailController.addListener(updateButtonState);
    super.onInit();
  }

  void updateButtonState() {
    isButtonEnabled.value = _isButtonEnabled();
     }

  bool _isButtonEnabled() {


    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<UserData> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Dio().post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.loginEndpoint}',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.data != null && response.data is Map<String, dynamic>) {
        UserData userData = UserData.fromJson(response.data);
        if (userData.token != null) {
          token = userData.token!;
          username = userData.data.name;
          _saveDataToSharedPreferences(token, username);
        } else {
          throw Exception("Token is null in the response");
        }

        return userData;
      } else {
        throw Exception("Invalid response format");
      }
    } catch (e) {
      debugPrint('Login failed: $e');
      rethrow;
    }
  }


  Future<void> _saveDataToSharedPreferences(String token, String username) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('user_token', token);
    prefs.setString('user_name', username);
  }
  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
