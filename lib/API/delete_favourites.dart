import 'package:amit_final_project/API/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

Future<void> deleteFromFavorites(int id) async {
  try {
    final token = GetStorage().read('user_token');

    String apiUrl = '${ApiEndpoints.baseUrl}${ApiEndpoints.favoritesEndpoint}/$id';

    var dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.delete(apiUrl);

    if (response.statusCode == 200) {
      print('Deleted job with ID $id from favorites');
      print(response.data);
    } else {
      print('Failed to delete job from favorites');
    }
  } catch (error) {
    print('Error deleting job from favorites: $error');
  }
}
