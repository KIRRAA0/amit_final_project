import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  final ValueChanged<bool>? onChecked;

  const CheckboxExample({Key? key, this.onChecked}) : super(key: key);

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
              widget.onChecked?.call(isChecked);
            });
          },
        ),
        const Text(
          'Remember Me',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
