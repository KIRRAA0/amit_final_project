import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../Model/jobs_model.dart';

class StyledContainer extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const StyledContainer({
    Key? key,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final JobModel job;

  const CarouselItem({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: const Color(0xff091a7a),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
              SizedBox(height: 10,),
              Wrap(
                runSpacing: 6.5,
                spacing: 6.5,
                children: [
                  Category9ItemWidget(data: job.jobTimeType,),
                  Category9ItemWidget(data: job.jobLevel,),
                  Category9ItemWidget(data: job.compName,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 3),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "12K-15K",
                          ),
                          TextSpan(
                            text: "/Month",
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: const Text(
                      "Apply now",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          return CarouselItem(job: job);
        },
      );
    }).toList(),
  );
}

class Category9ItemWidget extends StatelessWidget {
  final String data;

  const Category9ItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 23,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.14),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        data,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
