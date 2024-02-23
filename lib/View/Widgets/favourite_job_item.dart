import 'package:amit_final_project/API/delete_favourites.dart';
import 'package:amit_final_project/View/Widgets/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../Model/favourite_model.dart';
import '../Widgets/inter_text_style.dart';

class FavouriteJobListItem extends StatelessWidget {
  final Favorite job;
  final VoidCallback onDelete;


  const FavouriteJobListItem({super.key, required this.job, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  job.job!.image,
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
                      job.job!.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${job.job!.compName} • Egypt",
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
                  Iconsax.more,
                  size: 30,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                     return ModalPage(job: job.job!, onDelete: onDelete,);
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterTextStyle.getTextWidget(
                  text: 'posted 2 days ago', size: 12, opacity: 0.5),
              Text.rich(
                TextSpan(
                  text: "\$${job.job!.salary.substring(0, 2)}K",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  children: [
                    TextSpan(
                      text: "/Month",
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
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
    );
  }
}
