import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Favourite_jobs_controller.dart';
import '../../Model/favourite_model.dart';
import '../Widgets/favourite_job_item.dart';

class FavoriteJobsScreen extends StatelessWidget {
  final FavoriteJobsController _controller = Get.put(FavoriteJobsController());

  FavoriteJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Jobs'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _controller.fetchFavoriteJobs();
        },
        child: Obx(() {
          return _controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : _controller.favoriteJobs.isEmpty
                  ? _buildNoFavoriteJobsWidget(context)
                  : _buildFavoriteJobsList(context);
        }),
      ),
    );
  }

  Widget _buildNoFavoriteJobsWidget(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No favorite jobs yet',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () async {
                await _controller.fetchFavoriteJobs();
              },
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteJobsList(BuildContext context) {
    return ListView.separated(
      itemCount: _controller.favoriteJobs.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (context, index) {
        Favorite job = _controller.favoriteJobs[index];
        return FavouriteJobListItem(
          job: job,
          onDelete: () => _controller.deleteJobFromFavorites(job.id),
        );
      },
    );
  }
}
