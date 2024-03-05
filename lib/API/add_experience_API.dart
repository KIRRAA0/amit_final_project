import 'package:amit_final_project/API/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> addExperience(String position,String workType,String compName,String location,String start,) async {
  try {
    print(position);
    print(workType);
    print(compName);
    print(location);
    print(start);
    final token = GetStorage().read('user_token');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id');
    print(userId);
    Map<String, dynamic> data = {
      "user_id": userId,
      "postion": position,
      "type_work": workType,
      "comp_name": compName,
      "location": location,
      "start": start,
      "end": null,
    };

    var dio = Dio();
    dio.options.followRedirects = true;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.post(
      ApiEndpoints.baseUrl + ApiEndpoints.experienceEndpoint,
      data: data,
    );
    if (response.statusCode == 200) {
      print('Added to favorites');
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
