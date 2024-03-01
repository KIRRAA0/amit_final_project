import 'package:flutter/material.dart';
import '../../API/get_all_jobs_API.dart'; // Ensure this contains fetchCountries method
import '../../Model/countries_model.dart'; // Ensure this matches your JSON structure

class CountriesListScreen extends StatefulWidget {
  @override
  _CountriesListScreenState createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  late Future<List<Country>> countries;
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    countries = fetchCountries(); // This fetches countries from your API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Languages'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Country>>(
        future: countries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // For debugging
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (context, index) {
                var country = snapshot.data![index];
                String firstLanguage = country.languages.values.first;
                return ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ListTile(
                      leading: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                        child: Image.network(
                          country.flags.png,
                          width: 50,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(firstLanguage),
                      trailing: Radio<int>(
                        value: index,
                        groupValue: _selectedIndex,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedIndex = value!;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ],
                ).toList()[0];
              },
            );
          } else {
            return const Center(child: Text('No countries found'));
          }
        },
      ),
    );
  }
}
