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
    final screenWidth = MediaQuery.of(context).size.width;

    return TransparentContainerWithBorder(
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      screenWidth: screenWidth,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02), // Adjust padding dynamically
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstText,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Adjust font size dynamically
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
            SizedBox(
              height: screenWidth * 0.03, // Adjust height dynamically
            ),
            Text(
              secondText,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Adjust font size dynamically
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
  final double screenWidth;

  const TransparentContainerWithBorder({
    Key? key,
    required this.child,
    this.borderWidth = 1.0,
    this.borderRadius = 0.0,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.4, // Adjust container width dynamically
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.4),
          width: borderWidth,
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
