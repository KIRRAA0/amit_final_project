import 'package:get/get.dart';
import '../../Model/jobs_model.dart';

class JobSearchController extends GetxController {
  RxList<JobModel> jobsList = RxList<JobModel>();
  RxList<JobModel> filteredJobs = RxList<JobModel>();
  var showPlaceholder = false.obs;

  void filterJobs(String query) {
    if (query.isEmpty) {
      filteredJobs.assignAll(jobsList);
      showPlaceholder.value = true;
    } else {
      filteredJobs.assignAll(
        jobsList
            .where(
                (job) => job.name.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
      showPlaceholder.value = false;
    }
    filteredJobs.refresh();
  }
}
