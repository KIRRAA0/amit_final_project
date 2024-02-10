import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../chats/messages_screen.dart';
import 'home_screen.dart';

class HomeContent extends StatelessWidget {
  HomeContent({Key? key}) : super(key: key);

  final RxInt currentIndex = 0.obs;

  // Define a list of functions that return widgets
  final List<Widget Function()> pageFactories = [
        () => HomeScreen(),
        () => const MessagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: currentIndex.value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home, size: 34),
            activeIcon: Icon(Iconsax.home_15,size: 34,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message, size: 34),
            activeIcon: Icon(Iconsax.message5,size: 34,),
            label: 'Messages',
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Colors.blue),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: (index) {
          currentIndex.value = index; // This should be safe as it's only updating an observable
        },
      )),
      body: Obx(() => pageFactories[currentIndex.value]()), // Call the function to create the widget
    );
  }
}
