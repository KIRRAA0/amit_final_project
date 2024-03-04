import 'package:flutter/material.dart';

class PersonalDetailsWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;

  const PersonalDetailsWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  @override
  State<PersonalDetailsWidget> createState() => _PersonalDetailsWidgetState();
}

class _PersonalDetailsWidgetState extends State<PersonalDetailsWidget> {
  bool _isTapped = false;

  void _handleTap() {
    widget.onTap();
    setState(() {
      _isTapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color color = _isTapped ? Colors.blue : Colors.grey;

    return GestureDetector(
      onTap: _handleTap,
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: color,
              size: 24,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
