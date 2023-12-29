import 'package:flutter/material.dart';

class UserInfoWithNotification extends StatelessWidget {
  final Future<String?> usernameFuture;

  const UserInfoWithNotification({
    Key? key,
    required this.usernameFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: usernameFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError || snapshot.data == null) {
          return Text('Error fetching username');
        } else {
          String username = snapshot.data!;
          return _buildUserInfo(username);
        }
      },
    );
  }

  Widget _buildUserInfo(String username) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $username👋',
              style: const TextStyle(
                color: Color(0xFF111827),
                fontSize: 24,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Create a better future for yourself here',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.14,
              ),
            ),
          ],
        ),
        NotificationIconButton(),
      ],
    );
  }
}


class NotificationIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Icon(Icons.notifications_outlined),
        onPressed: () {
          // Add your notification handling logic here
        },
      ),
    );
  }
}
