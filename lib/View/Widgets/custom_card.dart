import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData iconData;
  final String cardText;

  CustomCard({
    Key? key,
    required this.isSelected,
    this.onTap,
    required this.iconData,
    required this.cardText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? const Color(0xFFD6E4FF) : const Color(0xFFFAFAFA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.black,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Icon(iconData, color: isSelected ? Colors.blue : Colors.black),
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: Text(
                  cardText,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
