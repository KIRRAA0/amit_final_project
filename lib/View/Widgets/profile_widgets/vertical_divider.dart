import 'package:flutter/material.dart';

class VerticalDividerr extends StatelessWidget {
  final double height;
  final double thickness;
  final double width;
  final Color color;
  final Color textColor;

  VerticalDividerr({super.key,
    this.height = 50,
    this.thickness = 2,
    this.width = 20,
    this.color = Colors.blueAccent,
    this.textColor = const Color(0xff666666),
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: height,
            child: VerticalDivider(
              thickness: thickness,
              width: width,
              color: color,
            ),
          ),
          Text(
            '',
            style: TextStyle(color: textColor),
          )
        ],
      ),
    );
  }
}
