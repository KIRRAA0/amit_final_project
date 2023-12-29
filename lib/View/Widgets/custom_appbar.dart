import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    required List<Padding> actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Image.asset(
            "assets/Logo.png",
            width: 100,
          ),
        ),
      ],
    );
  }
}
