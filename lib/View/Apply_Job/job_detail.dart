import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_switcher/slide_switcher.dart';
import '../../Model/jobs_model.dart';

class JobDetailsPage extends StatefulWidget {
  final JobModel job;

  const JobDetailsPage({Key? key, required this.job}) : super(key: key);

  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  int selectedIndex = 0; // Maintain the selected index in the state

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Detail'),
        centerTitle: true,
        actions: const [
          Icon(Iconsax.save_minus),
          SizedBox(width: 10),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  widget.job.image,
                  width: screenWidth * 0.21,
                  height: screenHeight * 0.1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              widget.job.name,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.027,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.009),
            Text(
              "${widget.job.compName} • EGYPT",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6),
                  fontSize: screenHeight * 0.017,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Wrap(
              spacing: 6,
              children: [
                buildTagContainer('Full-time', Colors.blue[100]!),
                buildTagContainer('Remote', Colors.blue[100]!),
                buildTagContainer('Senior', Colors.blue[100]!),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            SlideSwitcher(
              onSelect: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              containerHeight: 44,
              containerWight: screenWidth - 32,
              containerColor: Colors.grey.shade300,
              containerBorderRadius: 20.0,
              slidersColors: [Colors.blue.shade900],
              slidersBorder: Border.all(color: Colors.transparent),
              children: [
                buildSwitcherChild('Description', 0),
                buildSwitcherChild('Company', 1),
                buildSwitcherChild('People', 2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitcherChild(String text, int index) {
    bool isSelected = index == selectedIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14,
          ),
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
          style: const TextStyle(color: Colors.indigoAccent),
        ),
      ),
    );
  }
}
