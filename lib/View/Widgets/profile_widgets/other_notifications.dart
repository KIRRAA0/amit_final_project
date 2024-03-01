import 'package:flutter/material.dart';

import 'notification_tile.dart';

class OtherNotifications extends StatelessWidget {
  const OtherNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NotificationSwitch(leadingText: 'Show Profile'),
        NotificationSwitch(leadingText: 'All messages'),
        NotificationSwitch(leadingText: 'Messages nudges'),
      ],
    );
  }
}
