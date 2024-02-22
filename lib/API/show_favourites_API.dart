import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../Model/favourite_model.dart';
import 'endpoints.dart';

Future<List<Favorite>> fetchFavouriteJobs() async {
  try {
    final token = GetStorage().read('user_token');
    Dio dio = Dio();
    final response = await dio.get(
      '${ApiEndpoints.baseUrl}${ApiEndpoints.favoritesEndpoint}',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((json) => Favorite.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch jobs: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to fetch jobs: $e');
  }
}
