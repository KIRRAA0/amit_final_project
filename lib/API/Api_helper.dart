import 'package:amit_final_project/API/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/jobs_model.dart';
import '../Model/users_model.dart';

class ApiData {
  final dio = Dio();
  late String authToken;

  ApiData() {
    _loadAuthToken();
  }

  Future<void> _loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('token') ?? '';
  }

  Future<UserData> getProfile() async {
    try {
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $authToken";
      final response = await dio
          .get('${ApiEndpoints.baseUrl}${ApiEndpoints.profileEndpoint}');
      UserData userData = UserData.fromJson(response.data);

      saveUserDataToPrefs(userData);

      return userData;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return UserData(
        status: false,
        data: UserDataDetails(
          name: '',
          email: '',
          otp: 0,
          updatedAt: '',
          createdAt: '',
          id: 0,
        ),
        profile: UserProfile(
          userId: 0,
          name: '',
          email: '',
          updatedAt: '',
          createdAt: '',
          id: 0,
        ),
        token: '',
      );
    }
  }

  Future<void> saveUserDataToPrefs(UserData userData) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('username', userData.data.name);
    prefs.setString('email', userData.data.email);
    prefs.setInt('userId', userData.data.id);
    prefs.setString('token', userData.token.toString());

    authToken = userData.token.toString();
  }

  Future<List<JobModel>> fetchJobs(String token) async {
    try {
      final response = await dio.get(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.jobsEndpoint}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      final List<dynamic> data = response.data['data'];
      return data.map((json) => JobModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch jobs: $e');
    }
  }

}
