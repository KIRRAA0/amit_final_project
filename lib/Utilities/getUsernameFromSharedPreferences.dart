import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getUsernameFromSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? retrievedUsername = prefs.getString('user_name');
  print('Retrieved username: $retrievedUsername');
  return retrievedUsername;
}