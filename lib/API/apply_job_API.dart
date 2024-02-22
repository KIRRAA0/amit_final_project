import 'package:amit_final_project/API/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../Model/jobs_model.dart';

Future<void> applyToJob(JobModel job) async {
  try {
    String name = GetStorage().read('user_name') ?? '';
    String email = GetStorage().read('user_email') ?? '';
    final fileName1 = GetStorage().read('uploaded_file_name1_name') ?? '';
    final fileName2 = GetStorage().read('uploaded_file_name2_name') ?? '';
    final filePath1 = GetStorage().read('uploaded_file_name1_path') ?? '';
    final filePath2 = GetStorage().read('uploaded_file_name2_path') ?? '';
    final phone = GetStorage().read('user_phone') ?? '';
    final token = GetStorage().read('user_token');
    FormData formData = FormData.fromMap({
      "cv_file": await MultipartFile.fromFile(filePath1, filename: fileName1),
      "name": name,
      "email": email,
      "mobile": phone,
      "work_type": "full-time",
      "other_file":
          await MultipartFile.fromFile(filePath2, filename: fileName2),
      "jobs_id": job.id,
      "user_id": "1",
    });

    // Make the API request
    var dio = Dio();
    dio.options.followRedirects = true;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.post(
      ApiEndpoints.baseUrl + ApiEndpoints.applyEndpoint,
      data: formData, // Use FormData
    );
    if (response.statusCode == 200) {
      print('Applied to job successfully');
      print(response.data);
    } else {
      // Handle other status codes
      print('Failed to apply to job');
    }
  } catch (error) {
    // Handle errors
    print('Error applying to job: $error');
  }
}
