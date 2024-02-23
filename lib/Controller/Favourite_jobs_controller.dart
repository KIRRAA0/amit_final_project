import 'package:get/get.dart';
import '../../API/show_favourites_API.dart';
import '../../Model/favourite_model.dart';
import '../API/delete_favourites.dart';

class FavoriteJobsController extends GetxController {
  var favoriteJobs = <Favorite>[].obs;
  var isLoading = true.obs;
  var hasLoadedData = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteJobs();
  }

  Future<void> fetchFavoriteJobs() async {
    try {
      isLoading.value = true;
      var jobs = await fetchFavouriteJobs();
      if (jobs.isNotEmpty) {
        favoriteJobs.assignAll(jobs);
        favoriteJobs.refresh();
        hasLoadedData.value = true;
      }
    } catch (e) {
      print('Error fetching favorite jobs: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteJobFromFavorites(int id) async {
    try {
      await deleteFromFavorites(id);
      favoriteJobs.removeWhere((job) => job.id == id);
      favoriteJobs.refresh();
    } catch (e) {
      print('Error deleting job from favorites: $e');
    }
  }
}
