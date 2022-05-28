import 'package:donut/src/models/tests/items.dart';
import 'package:flutter/material.dart';

import 'package:donut/src/homepage/donate/add_item_donate.dart';
import 'package:donut/src/constants.dart';

class DonateItemWidget extends StatelessWidget {
  const DonateItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Itmes item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: item.isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (!item.isSender) ...[
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage:
                            AssetImage("assets/images/profile_pic.jpeg"),
                      ),
                      Column(
                        children: [
                          const SizedBox(width: kDefaultPadding / 2),
                          Image.asset(item.picture),
                        ],
                      ),
                    ],
                  ],
                ),
                if (item.isSender) ...[
                  const SizedBox(width: kDefaultPadding / 2),
                  Image.asset(item.picture),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
