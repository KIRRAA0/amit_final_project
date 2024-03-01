import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../inter_text_style.dart';

class SecurityTile extends StatelessWidget {
  final String leadingText;
  final String trailingText;
  final VoidCallback onPressed;

  const SecurityTile({
    super.key,
    required this.leadingText,
    required this.trailingText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 7),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(
              height: 44,
              child: ListTile(
                leading:
                    InterTextStyle.getTextWidget(text: leadingText, size: 16),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InterTextStyle.getTextWidget(
                      text: trailingText,
                      opacity: 0.4,
                      size: 13,
                    ),
                    const Icon(
                      Iconsax.arrow_right_3,
                      size: 20,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
