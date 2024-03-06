import 'package:amit_final_project/API/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

Future<void> addToFavourites(int id) async {
  try {
    final token = GetStorage().read('user_token');

    Map<String, dynamic> data = {
      "job_id": id,
      "like" : "0",
      "image" : null,
      "location" : "no location",
    };

    var dio = Dio();
    dio.options.followRedirects = true;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.post(
      ApiEndpoints.baseUrl + ApiEndpoints.favoritesEndpoint,
      data: data,
    );
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      // Handle other status codes
      print('Failed to add to favs');
    }
  } catch (error) {
    // Handle errors
    print('Error adding to favs: $error');
  }
}
