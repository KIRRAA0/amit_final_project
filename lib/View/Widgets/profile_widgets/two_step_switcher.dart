import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitchWidget extends StatefulWidget {
  @override
  _CustomSwitchWidgetState createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool _isSwitched = false; // Initial state of the switch

  void _toggleSwitch(bool value) {
    // This function is called whenever the switch is toggled
    setState(() {
      _isSwitched = value;
      // Here you can also add any logic that needs to happen when the switch is toggled
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Expanded(
            child: Text(
              'Secure your account with two-step verification',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          CupertinoSwitch(
            value: _isSwitched,
            onChanged: _toggleSwitch,
          ),
        ],
      ),
    );
  }
}