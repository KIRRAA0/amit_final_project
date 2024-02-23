import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:amit_final_project/View/Widgets/profile_widgets/information_row.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../Widgets/sliver_appbar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  String name = GetStorage().read('user_name') ?? '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverAppBar(expandedHeight: 150.0),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InterTextStyle.getTextWidget(text: name,size: 22),
                  InterTextStyle.getTextWidget(text: 'Senior UI/UX Designer',size: 12,opacity: 0.5),
                  const InfoRow(),
                ],
              ),
            ]),
          )
        ],
      ),
    ));
  }

}

