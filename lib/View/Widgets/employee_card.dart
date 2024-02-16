import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String position;
  final String company;
  final String duration;

  const EmployeeCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.position,
    required this.company,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // First Column for the image
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 24,
            ),
            // Spacer or SizedBox for spacing
            const SizedBox(width: 8),
            // Second Column for the text and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '$position at $company',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Third Column for the duration text
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Work during',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// Usage example:
/*
EmployeeCard(
  imageUrl: 'https://via.placeholder.com/150',
  name: 'Dimas Adi Saputro',
  position: 'Senior UI/UX Designer',
  company: 'Twitter',
  duration: '5 Years',
),
*/
