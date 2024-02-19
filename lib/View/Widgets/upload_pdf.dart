import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import 'pdf_tile.dart';

class FileUploadContainer extends StatelessWidget {
  final RxString fileName = ''.obs;

  FileUploadContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => fileName.value.isEmpty
          ? DottedBorder(
              dashPattern: const [8, 6],
              color: Colors.blue,
              borderType: BorderType.RRect,
              strokeWidth: 2,
              radius: const Radius.circular(12),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                color: Colors.blue.withOpacity(0.15),
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Iconsax.document_upload5,
                      size: 40,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 10),
                    const Text("Upload File", style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue.withOpacity(0.16),
                            side: const BorderSide(color: Colors.blueAccent),
                          ),
                          onPressed: () => pickAndUploadPDF(context),
                          icon:
                              const Icon(Iconsax.arrow_up, color: Colors.blue),
                          label: const Text(
                            "Choose File",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : PdfTile(
              fileName: fileName.value,
              onCancel: () => fileName.value = '',
              onEdit: () =>pickAndUploadPDF(context),
            )),
    );
  }

  Future<void> pickAndUploadPDF(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        fileName.value = result.files.first.name;
      } else {
        // User canceled the file picker
        print('User canceled the file picker.');
      }
    } catch (error) {
      print('Upload failed: $error');
    }
  }
}
