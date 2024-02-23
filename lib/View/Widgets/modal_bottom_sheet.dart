import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../Model/jobs_model.dart';
import '../Apply_Job/job_detail.dart';
import 'outlined_modal_button.dart';

class ModalPage extends StatelessWidget {
  final JobModel job;
  final VoidCallback onDelete;

  const ModalPage({super.key, required this.job, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ModalOutlinedButton(
          onPressed: () {
            Navigator.pop(context);

            Get.to(() => JobDetailsPage(job: job),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 400));
          },
          text: 'Apply Job',
          icon: const Icon(Iconsax.document),
        ),
        ModalOutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'Share via...',
          icon: const Icon(Iconsax.export_1),
        ),
        ModalOutlinedButton(
          onPressed: () {
            onDelete();
            Navigator.pop(context);
          },
          text: 'Cancel Save',
          icon: const Icon(Iconsax.save_minus),
        ),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }
}
