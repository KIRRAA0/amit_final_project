import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ExpansionTile(
              title: Text(title),
              children: children,
            ),
          ),
        )
    );
  }
}
