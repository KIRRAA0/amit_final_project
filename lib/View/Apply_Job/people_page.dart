import 'package:flutter/material.dart';
import '../../Model/jobs_model.dart';
import '../Widgets/employee_list.dart';

class PeoplePage extends StatelessWidget {
  final JobModel job;

  const PeoplePage({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownValue =
        'UI/UX Designer'; // The initial value for the dropdown

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "6 Employees For ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "UI/UX Design ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.4)),
                  ),
                ],
              ),
              DecoratedBox(
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {},
                      items: <String>[
                        'UI/UX Designer',
                        'Developer',
                        'Project Manager'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // Adding a small gap
          const Flexible(

            child: EmployeeList(),
          ),
        ],
      ),
    );
  }
}
