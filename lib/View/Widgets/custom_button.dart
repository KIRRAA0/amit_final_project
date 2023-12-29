import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isButtonEnabled;

  const CustomButton({
    required this.onPressed,
    required this.text,
    required this.isButtonEnabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isButtonEnabled
                  ? [Colors.blue, Colors.indigoAccent]
                  : [Colors.grey, Colors.grey],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: isButtonEnabled ? Colors.white : Colors.grey,
              backgroundColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            onPressed: isButtonEnabled ? onPressed : null,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
