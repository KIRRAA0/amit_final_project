import 'package:flutter/material.dart';

import 'employee_card.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> employees = List.generate(
      6,
          (index) =>
      {
        'imageUrl': 'https://www.fotolog.com/wp-content/uploads/2020/05/best-suits-for-men-featured-image-final-696x541.jpg',
        'name': 'Dimas Adi Saputro',
        'position': 'Senior UI/UX Designer',
        'company': 'Twitter',
        'duration': '5 Years',
      },
    );

    return ListView.separated(
      itemCount: employees.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var employee = employees[index];
        return EmployeeCard(
          imageUrl: employee['imageUrl']!,
          name: employee['name']!,
          position: employee['position']!,
          company: employee['company']!,
          duration: employee['duration']!,
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return const Divider();

    },
    );
  }
}