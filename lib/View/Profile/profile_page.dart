import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/profile_widgets/about.dart';
import '../Widgets/profile_widgets/information_row.dart';
import '../Widgets/profile_widgets/profile_genral_tile.dart';
import '../Widgets/sliver_appbar.dart';
import '../Widgets/inter_text_style.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<String>(
        future: _getUserName(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              String userName = snapshot.data ?? ''; // Retrieve the user name
              return Material(
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: MySliverAppBar(expandedHeight: 150.0),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(height: 60),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InterTextStyle.getTextWidget(text: userName, size: 22),
                            InterTextStyle.getTextWidget(
                                text: 'Senior UI/UX Designer', size: 12, opacity: 0.5),
                            const InfoRow(),
                            const AboutColumn(),
                            Container(
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
                                child: Text(
                                  'General',
                                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              separatorBuilder: (BuildContext context, int index) => const Divider(),
                              itemBuilder: (BuildContext context, int index) {
                                IconData iconData;
                                String text;
                                VoidCallback onTap;
                                switch (index) {
                                  case 0:
                                    iconData = Iconsax.profile_circle;
                                    text = 'Edit Profile';
                                    onTap = () {
                                    };
                                    break;
                                  case 1:
                                    iconData = Iconsax.folder;
                                    text = 'Portfolio';
                                    onTap = () {
                                    };
                                    break;
                                  case 2:
                                    iconData = Iconsax.global;
                                    text = 'Language';
                                    onTap = () {
                                      // Functionality for the Notifications tile
                                    };
                                    break;
                                  case 3:
                                    iconData = Iconsax.notification;
                                    text = 'Notifications';
                                    onTap = () {
                                      // Functionality for the Favorites tile
                                    };
                                    break;
                                  case 4:
                                    iconData = Iconsax.lock;
                                    text = 'Login and Security';
                                    onTap = () {
                                      // Functionality for the Help tile
                                    };
                                    break;
                                  default:
                                    iconData = Icons.error;
                                    text = 'Error';
                                    onTap = () {
                                      // Default functionality
                                    };
                                }

                                return GeneralTile(
                                  icon: iconData,
                                  text: text,
                                  onTap: onTap,
                                );
                              },
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.black.withOpacity(0.1),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
                                child: Text(
                                  'Others',
                                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              separatorBuilder: (BuildContext context, int index) => const Divider(),
                              itemBuilder: (BuildContext context, int index) {
                                IconData iconData;
                                String text;
                                VoidCallback onTap;
                                bool showIcon;
                                switch (index) {
                                  case 0:
                                    iconData = Iconsax.profile_circle;
                                    text = 'Accessibility';
                                    onTap = () {
                                    };
                                    break;
                                  case 1:
                                    iconData = Iconsax.folder;
                                    text = 'Help Center';
                                    onTap = () {
                                    };
                                    break;
                                  case 2:
                                    iconData = Iconsax.global;
                                    text = 'Terms & Conditions';
                                    onTap = () {
                                    };
                                    break;
                                  case 3:
                                    iconData = Iconsax.notification;
                                    text = 'Privacy Policy';
                                    onTap = () {
                                      // Functionality for the Favorites tile
                                    };
                                    break;
                                  default:
                                    iconData = Icons.error;
                                    text = 'Error';
                                    onTap = () {
                                      // Default functionality
                                    };
                                }

                                return GeneralTile(
                                  icon: iconData,
                                  text: text,
                                  onTap: onTap,
                                  showIcon: false,

                                );
                              },
                            ),
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }

  Future<String> _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_name') ?? ''; // Retrieving the user name
  }
}
