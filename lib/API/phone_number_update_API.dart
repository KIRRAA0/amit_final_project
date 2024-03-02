import 'package:amit_final_project/API/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

void updatePhoneNumber(String newPhoneNumber) async {
  try {
    final token = GetStorage().read('user_token');
    Dio dio = Dio();
    dio.options.followRedirects = true;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    String url = "${ApiEndpoints.baseUrl}${ApiEndpoints.editProfileEndpoint}";
    Response response = await dio.put(
      url,
      queryParameters: {
        "mobile": newPhoneNumber,
      },
    );

    if (response.statusCode == 200) {
      // Success
      print('Phone number updated successfully');
    } else {
      // Handle other status codes
      print('Failed to update phone number: ${response.statusCode}');
    }
  } catch (error) {
    // Handle Dio errors
    print('Error updating phone number: $error');
  }
}
