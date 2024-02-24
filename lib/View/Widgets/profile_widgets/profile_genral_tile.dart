import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GeneralTile extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onTap;
  final bool showIcon;

  const GeneralTile({
    required this.text,
    required this.onTap,
    this.icon,
    this.showIcon = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: showIcon ? Icon(
        icon,
        color: Colors.blue,
        size: 30,
      ) : null,
      title: Text(text),
      trailing: Icon(Iconsax.arrow_right_3,),
      onTap: onTap,
    );
  }
}
