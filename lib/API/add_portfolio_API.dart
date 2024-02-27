import 'dart:ui';

import 'package:amit_final_project/API/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

Future<void> addPortfolio() async {
  try {
    final portfolioName = GetStorage().read('portfolio_name') ?? '';
    final portfolioPath = GetStorage().read('portfolio_path') ?? '';
    final token = GetStorage().read('user_token');
    FormData formData = FormData.fromMap({
      "cv_file": await MultipartFile.fromFile(portfolioPath, filename: portfolioName),
      "image" : await MultipartFile.fromFile(portfolioPath, filename: portfolioName),
    });

    var dio = Dio();
    dio.options.followRedirects = true;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.post(
      ApiEndpoints.baseUrl + ApiEndpoints.portfolioEndpoint,
      data: formData,
    );
    if (response.statusCode == 200) {
      print('Portfolio saved successfully');
      print(response.data);
    } else {
      print('Failed to apply to job');
    }
  } catch (error) {
    print('Error applying to job: $error');
  }
}
