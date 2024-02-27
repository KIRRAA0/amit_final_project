import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../Model/portfolio_model.dart';
import 'endpoints.dart';

Future<UserData> fetchPortfoliosAPI() async {
  try {
    final token = GetStorage().read('user_token');
    Dio dio = Dio();
    final response = await dio.get(
      '${ApiEndpoints.baseUrl}${ApiEndpoints.portfolioEndpoint}',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      final dynamic responseData = response.data;
      if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
        final dynamic data = responseData['data'];
        return UserData.fromJson(data);
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Failed to fetch portfolios: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to fetch portfolios: $e');
  }
}
