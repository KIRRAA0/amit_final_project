import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart'; // Import GetStorage

import '../Widgets/inter_text_style.dart';
import '../Widgets/upload_pdf.dart';

class UploadPortfolioPage extends StatelessWidget {
  const UploadPortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Read the file names from GetStorage
    final uploadedFileName1 = GetStorage().read('uploaded_file_name1') ?? '';
    final uploadedFileName2 = GetStorage().read('uploaded_file_name2') ?? '';

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
            FileUploadContainer(
              initialFileName: uploadedFileName1,
              storageKey: 'uploaded_file_name1',
            ),
            InterTextStyle.getTextWidget(text: 'Other File',),
            FileUploadContainer(
              initialFileName: uploadedFileName2,
              storageKey: 'uploaded_file_name2',
            ),
            Text(GetStorage().read('uploaded_file_name1_name') ?? 'null')
          ],
        ),
      ),
    );
  }
}
