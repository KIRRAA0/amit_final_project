import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ModalOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Widget icon;

  const ModalOutlinedButton({super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 18),
      child: SizedBox(
        height: 55,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
          onPressed: onPressed,
          child: Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text,style: TextStyle(fontSize: 15),),
                ),
              ),
              const Icon(Iconsax.arrow_right_3),
            ],
          ),
        ),
      ),
    );
  }
}