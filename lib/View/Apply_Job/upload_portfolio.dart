import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:flutter/material.dart';

import '../Widgets/upload_pdf.dart';

class UploadPortfolioPage extends StatelessWidget {
  const UploadPortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload portfolio",
              style: TextStyle(fontSize: 23),
            ),
            Text(
              "Fill Your Bio data correctly",
              style: TextStyle(
                  fontSize: 14.5, color: Colors.black.withOpacity(0.5)),
            ),
            SizedBox(height: screenHeight * 0.045),
            InterTextStyle.getTextWidget(text: 'Upload CV',),
            FileUploadContainer(),
            InterTextStyle.getTextWidget(text: 'Other File',),
            FileUploadContainer(),
          ],
        ),
      ),
    );
  }
}