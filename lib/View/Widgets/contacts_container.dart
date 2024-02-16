import 'package:flutter/material.dart';

class ContactsContainer extends StatelessWidget {
  final String firstText;
  final String secondText;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;

  const ContactsContainer({
    Key? key,
    required this.firstText,
    required this.secondText,
    this.borderWidth = 1.0,
    this.borderRadius = 15.0,
    this.borderColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransparentContainerWithBorder(
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstText,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              secondText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransparentContainerWithBorder extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;

  const TransparentContainerWithBorder({
    Key? key,
    required this.child,
    this.borderWidth = 1.0,
    this.borderRadius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.4),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}
