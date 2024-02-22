import 'package:flutter/material.dart';
import '../../API/show_favourites_API.dart';
import '../../Model/favourite_model.dart';
import '../Widgets/favourite_job_item.dart';

class FavoriteJobsScreen extends StatefulWidget {
  const FavoriteJobsScreen({super.key});

  @override
  _FavoriteJobsScreenState createState() => _FavoriteJobsScreenState();
}

class _FavoriteJobsScreenState extends State<FavoriteJobsScreen> {
  late Future<List<Favorite>> _favoriteJobsFuture;

  @override
  void initState() {
    super.initState();
    _favoriteJobsFuture = fetchFavouriteJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jobs'),
      ),
      body: FutureBuilder<List<Favorite>>(
        future: _favoriteJobsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Favorite> favoriteJobs = snapshot.data ?? [];
            return ListView.separated(
              itemCount: favoriteJobs.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(), // Add a divider between items
              itemBuilder: (context, index) {
                Favorite job = favoriteJobs[index];
                return FavouriteJobListItem(job: job);
              },
            );

          }
        },
      ),
    );
  }
}
