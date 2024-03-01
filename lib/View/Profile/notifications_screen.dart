import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:flutter/material.dart';

import '../Widgets/profile_widgets/job_notifications.dart';
import '../Widgets/profile_widgets/other_notifications.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey.withOpacity(0.15),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                child: InterTextStyle.getTextWidget(text: 'Job notification',size: 16,opacity: 0.5),
              ),
            ),
            const JobNotifications(),
            const SizedBox(height: 40,),
            Container(
              width: double.infinity,
              color: Colors.grey.withOpacity(0.15),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                child: InterTextStyle.getTextWidget(text: 'Other Notifications',size: 16,opacity: 0.5),
              ),
            ),
            const SizedBox(height: 10,),
            const OtherNotifications(),
          ],
        ),
      ),
    );
  }
}
