import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/endpoints.dart';
import '../Model/users_model.dart';

class RegistrationController extends GetxController {
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final RxBool isButtonEnabled = false.obs;

  String token = '';
  String username = '';
  String Email = '';
  int id = 0;

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    usernameController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
    emailController.addListener(updateButtonState);
    super.onInit();
  }

  void updateButtonState() {
    isButtonEnabled.value = _isButtonEnabled();
  }

  bool _isButtonEnabled() {

    return usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<UserData> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await Dio().post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.registerEndpoint}',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      UserData userData = UserData.fromJson(response.data);

      token = userData.token!;
      username = userData.data.name;
      Email =userData.data.email;
      id =userData.data.id;

      _saveDataToSharedPreferences(token,username,Email,id);

      return userData;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> _saveDataToSharedPreferences(String token, String username, String email,int id) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('user_token', token);
    prefs.setString('user_name', username);
    prefs.setString('user_email', email);
    prefs.setInt('user_id', id);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
