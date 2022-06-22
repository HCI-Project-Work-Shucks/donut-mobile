import 'package:donut/src/models/tests/donate_items.dart';
import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';

class DonateItemWidget extends StatelessWidget {
  const DonateItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DonateItmes item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: kDefaultPadding, left: kDefaultPadding, right: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: item.isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!item.isSender) ...[
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage:
                            AssetImage("assets/images/profile_pic.jpeg"),
                      ),
                      Text(item.name)
                    ],
                  ),
                  const SizedBox(width: kDefaultPadding / 2),
                  Image.asset(
                    item.picture,
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    'Item needed: ' + item.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Description: ' + item.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: kPrimaryColor,
                    child: const Text('Intereseted'),
                    onPressed: () {},
                  ),
                ],
                if (item.isSender) ...[
                  const SizedBox(width: kDefaultPadding / 2),
                  Image.asset(
                    item.picture,
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    'Item needed: ' + item.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Description: ' + item.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
