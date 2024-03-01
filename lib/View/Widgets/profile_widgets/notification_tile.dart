import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../inter_text_style.dart';

class NotificationSwitch extends StatefulWidget {
  final String leadingText;

  const NotificationSwitch({super.key, required this.leadingText});

  @override
  _TextWithSwitchState createState() => _TextWithSwitchState();
}

class _TextWithSwitchState extends State<NotificationSwitch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: InterTextStyle.getTextWidget(text: widget.leadingText),
          trailing: CupertinoSwitch(
            activeColor: Colors.blue,
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
        ),
        const Divider(),
      ],
    );
  }
}
