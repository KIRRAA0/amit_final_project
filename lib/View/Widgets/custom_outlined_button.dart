import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final String imagePath;
  final VoidCallback? onPressed;

  const CustomOutlinedButton({
    Key? key,
    required this.buttonText,
    required this.imagePath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Colors.blue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8),
          Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
