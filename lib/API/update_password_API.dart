import 'package:amit_final_project/API/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

Future<void> updatePassword(String newPassword) async {
  try {
    final token = GetStorage().read('user_token');
    final name = GetStorage().read('user_name');

    Map<String, dynamic> data = {
      "name" : name,
      "password" : newPassword,
    };

    var dio = Dio();
    dio.options.followRedirects = true;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.post(
      ApiEndpoints.baseUrl + ApiEndpoints.updatePasswordEndpoint,
      data: data,
    );
    if (response.statusCode == 200) {
      print('Password updated successfully');
      print(response.data);
    } else {
      print('Failed to Update Password');
    }
  } catch (error) {
    // Handle errors
    print('Error Updating password: $error');
  }
}
