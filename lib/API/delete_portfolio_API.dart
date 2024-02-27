import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import 'endpoints.dart';

Future<void> deletePortfolioAPI(int id) async {
  try {
    final token = GetStorage().read('user_token');
    final apiUrl =
        '${ApiEndpoints.baseUrl}${ApiEndpoints.portfolioEndpoint}/$id';
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await dio.delete(apiUrl);

    if (response.statusCode == 200) {
      print('Deleted portfolio with ID $id');
    } else {
      print('Failed to delete portfolio');
    }
  } catch (error) {
    print('Error deleting portfolio: $error');
  }
}
