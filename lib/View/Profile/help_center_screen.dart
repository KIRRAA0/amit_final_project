import 'package:amit_final_project/View/Widgets/custom_textfiled.dart';
import 'package:amit_final_project/View/Widgets/profile_widgets/expantion_tiles_list.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HelpCenter extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextField(
                  icon: Iconsax.search_normal,
                  labelText: 'What can we help?',
                  hintText: 'hintText',
                  controller: controller,
                ),
              ),
              const ExpansionTiles()
            ],
          ),
        ),
      ),
    );
  }
}
