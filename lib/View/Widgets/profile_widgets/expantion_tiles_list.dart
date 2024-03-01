import 'package:amit_final_project/View/Widgets/inter_text_style.dart';
import 'package:amit_final_project/View/Widgets/profile_widgets/security_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'custom_expantion_tile.dart';

class ExpansionTiles extends StatelessWidget {
  const ExpansionTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomExpansionTile(
          title: 'Lorem ipsum dolor sit amet',
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'),
            )
          ],
        ),
        CustomExpansionTile(
          title: 'Lorem ipsum dolor sit amet',
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'),
            )
          ],
        ),
        CustomExpansionTile(
          title: 'Lorem ipsum dolor sit amet',
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'),
            )
          ],
        ),
        CustomExpansionTile(
          title: 'Lorem ipsum dolor sit amet',
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'),
            )
          ],
        ),
        CustomExpansionTile(
          title: 'Lorem ipsum dolor sit amet',
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'),
            )
          ],
        ),
        CustomExpansionTile(
          title: 'Lorem ipsum dolor sit amet',
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.'),
            )
          ],
        ),
      ],
    );
  }
}
