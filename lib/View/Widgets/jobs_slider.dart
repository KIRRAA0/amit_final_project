import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../Model/jobs_model.dart';

Widget buildCarouselSlider(List<JobModel> jobs) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 175,
      enlargeCenterPage: true,
      viewportFraction: 0.8,
    ),
    items: jobs.map((job) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: const Color(0xff091a7a),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipOval(
                          child: Image.network(
                            job.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.18,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Zoom • ${job.jobType}',
                              style: const TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 12,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                                letterSpacing: 0.12,
                              ),
                            ),
                            const SizedBox(height: 18.0),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.bookmark_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      StyledContainer(
                        text: "Job level : ${job.jobLevel}",
                      ),
                      const SizedBox(width: 4.0),
                      StyledContainer(
                        text: job.jobTimeType,
                      ),
                      const SizedBox(width: 4.0),
                      StyledContainer(
                        text: job.jobType,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}

class StyledContainer extends StatelessWidget {
  final String text;

  const StyledContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
