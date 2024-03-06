import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'chat_page.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius:
                  BorderRadius.all(Radius.circular(35)),
                ),
                labelText: 'Search jobs',
                prefixIcon: Icon(Iconsax.search_normal),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(35)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 6,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the ChatScreen with arguments
                    Get.to(() => ChatScreen(), arguments: {
                      'name': 'User $index',
                      'image': 'assets/image_placeholder.png', // Replace with actual image path
                    });
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/image_placeholder.png'),
                    ),
                    title: Text('Title $index'),
                    subtitle: Text('Subtitle $index'),
                    trailing: const Text('12:39'),
                  ),
                );
              },            ),
          ),
        ],
      ),
    );
  }
}
