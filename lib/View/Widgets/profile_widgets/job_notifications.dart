import 'package:flutter/material.dart';

import 'notification_tile.dart';

class JobNotifications extends StatelessWidget {
  const JobNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
          NotificationSwitch(leadingText: 'Your job search alert'),
          NotificationSwitch(leadingText: 'Job Application Update'),
          NotificationSwitch(leadingText: 'Job Application Reminders'),
          NotificationSwitch(leadingText: 'Jobs You may be interested in'),
          NotificationSwitch(leadingText: 'Job seeker updates'),
        ],
    );
  }
}
