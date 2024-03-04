import 'package:amit_final_project/View/Profile/edit_profile_screen.dart';
import 'package:amit_final_project/View/Profile/help_center_screen.dart';
import 'package:amit_final_project/View/Profile/login_and_security.dart';
import 'package:amit_final_project/View/Profile/notifications_screen.dart';
import 'package:amit_final_project/View/Profile/portfolio_screen.dart';
import 'package:amit_final_project/View/Profile/privacy_policy.dart';
import 'package:amit_final_project/View/Profile/terms_conditions_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login_SignUp/setup_done.dart';
import '../Widgets/inter_text_style.dart';
import '../Widgets/profile_widgets/about.dart';
import '../Widgets/profile_widgets/information_row.dart';
import '../Widgets/profile_widgets/profile_genral_tile.dart';
import '../Widgets/sliver_appbar.dart';
import 'complete_profile.dart';
import 'languages_screen.dart';

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
              String userName = snapshot.data ?? '';
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
                            InterTextStyle.getTextWidget(
                                text: userName, size: 22),
                            InterTextStyle.getTextWidget(
                                text: 'Senior UI/UX Designer',
                                size: 12,
                                opacity: 0.5),
                            const InfoRow(),
                            const AboutColumn(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                width: double.infinity,
                                color: Colors.black.withOpacity(0.1),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 12),
                                  child: Text(
                                    'General',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ),
                              ),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 6,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (BuildContext context, int index) {
                                IconData iconData;
                                String text;
                                VoidCallback onTap;
                                switch (index) {
                                  case 0:
                                    iconData = Iconsax.profile_circle;
                                    text = 'Edit Profile';
                                    onTap = () {
                                      Get.to(() => const EditProfilePage(),
                                          transition:
                                              Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));
                                    };
                                  case 1:
                                    iconData = Iconsax.folder;
                                    text = 'Portfolio';
                                    onTap = () {
                                      Get.to(() => PortfolioPage(),
                                          transition:
                                          Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));
                                    };
                                  case 2:
                                    iconData = Iconsax.global;
                                    text = 'Language';
                                    onTap = () {
                                      Get.to(() => CountriesListScreen(),
                                          transition:
                                          Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));                                    };
                                  case 3:
                                    iconData = Iconsax.notification;
                                    text = 'Notifications';
                                    onTap = () {
                                      Get.to(() => const NotificationsPage(),
                                          transition:
                                          Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));                                           };
                                  case 4:
                                    iconData = Iconsax.lock;
                                    text = 'Login and Security';
                                    onTap = () {
                                      Get.to(() => const SecurityPage(),
                                          transition:
                                          Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));
                                    };
                                    case 5:
                                    iconData = Iconsax.profile_add5;
                                    text = 'Complete Profile';
                                    onTap = () {
                                      Get.to(() => CompleteProfile(),
                                          transition:
                                          Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));                                    };
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 12),
                                child: Text(
                                  'Others',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemBuilder: (BuildContext context, int index) {
                                IconData iconData;
                                String text;
                                VoidCallback onTap;
                                switch (index) {
                                  case 0:
                                    iconData = Iconsax.profile_circle;
                                    text = 'Accessibility';
                                    onTap = () {};
                                    break;
                                  case 1:
                                    iconData = Iconsax.folder;
                                    text = 'Help Center';
                                    onTap = () {
                                      Get.to(() => HelpCenter(),
                                          transition:
                                          Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));
                                    };
                                    break;
                                  case 2:
                                    iconData = Iconsax.global;
                                    text = 'Terms & Conditions';
                                    onTap = () {
                                      Get.to(() => TermsConditions(),
                                          transition:
                                          Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));
                                    };
                                    break;
                                  case 3:
                                    iconData = Iconsax.notification;
                                    text = 'Privacy Policy';
                                    onTap = () {
                                      Get.to(() => PrivacyPolicy(),
                                          transition:
                                          Transition.rightToLeftWithFade,
                                          duration: const Duration(
                                              milliseconds: 500));                                    };
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
