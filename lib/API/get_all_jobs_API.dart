import 'package:dio/dio.dart';
import '../Model/countries_model.dart';

Future<List<Country>> fetchCountries() async {
  var dio = Dio();
  try {
    final response = await dio.get('https://restcountries.com/v3.1/all');

    if (response.statusCode == 200) {
      List<dynamic> countriesJson = response.data;
      return countriesJson.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception('Failed to load countries: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load countries: $e');
  }
}
