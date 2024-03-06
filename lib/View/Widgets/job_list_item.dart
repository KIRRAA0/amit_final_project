import 'package:amit_final_project/API/add_favorites_API.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import '../../Model/jobs_model.dart';
import '../Apply_Job/job_detail.dart';

class JobListItem extends StatelessWidget {
  final JobModel job;

  JobListItem({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Get.to(() => JobDetailsPage(job: job),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    job.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${job.compName} • Egypt",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Iconsax.save_add,
                    size: 30,
                  ),
                  onPressed: () {
                    addToFavourites(job.id);
                    print(job.id);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Added to favourites"),
                      ),
                    );
                  },

                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 6,
                  children: [
                    buildTagContainer('Full-time', Colors.blue[100]!),
                    buildTagContainer('Remote', Colors.blue[100]!),
                    buildTagContainer('Senior', Colors.blue[100]!),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: "\$${job.salary.substring(0, 2)}K",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      // Adjust font size dynamically
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    children: [
                      TextSpan(
                        text: "/Month",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          // Adjust font size dynamically
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTagContainer(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
