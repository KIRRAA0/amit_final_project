import 'package:get/get.dart';
import '../../Model/jobs_model.dart';

class JobSearchController extends GetxController {
  RxList<JobModel> jobsList = RxList<JobModel>();
  RxList<JobModel> filteredJobs = RxList<JobModel>();

  void filterJobs(String query) {
    if (query.isEmpty) {
      filteredJobs.assignAll(jobsList);
    } else {
      filteredJobs.assignAll(
        jobsList
            .where(
                (job) => job.name.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
    filteredJobs.refresh();
  }
}
