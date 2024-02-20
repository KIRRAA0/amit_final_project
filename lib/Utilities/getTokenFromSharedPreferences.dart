import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getTokenFromSharedPreferences() async {
  String? retrievedToken = GetStorage().read('user_token');
  print('Retrieved___________________________---- retrievedToken: $retrievedToken');
  return retrievedToken;
}