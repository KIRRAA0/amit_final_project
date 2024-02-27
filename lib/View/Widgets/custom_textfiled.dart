import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChangedCallback;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.icon,
    this.obscureText = false,
    this.validator,
    this.onChangedCallback,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChangedCallback,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: widget.controller,
      obscureText: widget.obscureText && _obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(
            color: Color(0xFF3366FF),
            width: 2.0, // Adjust the width as needed
          ),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: _obscureText ? Colors.red : const Color(0xFF3366FF),
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
    );
  }
}
