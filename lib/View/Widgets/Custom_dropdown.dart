import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> categories;
  final RxString dropdownValue;

  CustomDropdown({required this.categories})
      : dropdownValue = categories.isNotEmpty ? categories[0].obs : ''.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.indigo[900],
          borderRadius: BorderRadius.circular(70.0),
        ),
        child: Obx(
              () => DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue.value,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              dropdownColor: Colors.indigo[900],
              onChanged: (String? newValue) {
                dropdownValue.value = newValue!;
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
