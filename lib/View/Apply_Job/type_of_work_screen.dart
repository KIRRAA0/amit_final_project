import 'package:amit_final_project/View/Widgets/type_of_work_tile.dart';
import 'package:flutter/material.dart';

class TypeOfWorkPage extends StatelessWidget {
  const TypeOfWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Type of work",
            style: TextStyle(fontSize: 23),
          ),
          Text(
            "Fill Your Bio data correctly",
            style: TextStyle(
                fontSize: 12.5, color: Colors.black.withOpacity(0.5)),
          ),
          SizedBox(height: screenHeight * 0.045),
          const Expanded(child: TypeOfWorkTile()),
        ],
      ),
    );
  }
}
