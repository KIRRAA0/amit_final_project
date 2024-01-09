import 'package:flutter/material.dart';
import '../../Model/jobs_model.dart';

class JobSearchDelegate extends SearchDelegate<List<JobModel>> {
  late final List<JobModel> jobs;

  JobSearchDelegate(this.jobs);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        if (Navigator.canPop(context)) {
          close(context, []);
          FocusManager.instance.primaryFocus?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.of(context).pop();
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredJobs = jobs
        .where((job) => job.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return buildSearchResults(filteredJobs);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredJobs = jobs
        .where((job) => job.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return buildSearchResults(filteredJobs);
  }

  Widget buildSearchResults(List<JobModel> searchResults) {
    final suggestedJobs = jobs
        .where((job) => job.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Suggested Jobs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildListView(suggestedJobs),
          const SizedBox(height: 16),
          const Text('Popular Jobs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildListView(suggestedJobs),
        ],
      ),
    );
  }

  Widget buildListView(List<JobModel> jobsList) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jobsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(jobsList[index].name),
          trailing: const Icon(Icons.remove_circle_outline,color: Colors.red,),
        );
      },
    );
  }
}
