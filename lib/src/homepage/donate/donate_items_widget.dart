import 'package:donut/src/models/tests/donate_items.dart';
import 'package:flutter/material.dart';

import 'package:donut/src/models/tests/chat.dart';
import 'package:donut/src/models/tests/message_test.dart';

import 'package:donut/src/constants.dart';

class DonateItemWidget extends StatefulWidget {
  final DonateItmes item;
  const DonateItemWidget({
    Key? mykey,
    required this.item,
  }) : super(key: mykey);
  @override
  _DonateItemWidgetState createState() => _DonateItemWidgetState();
}

class _DonateItemWidgetState extends State<DonateItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: kDefaultPadding, left: kDefaultPadding, right: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: widget.item.isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!widget.item.isSender) ...[
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage:
                            AssetImage("assets/images/profile_pic.jpeg"),
                      ),
                      Text(widget.item.name)
                    ],
                  ),
                  const SizedBox(width: kDefaultPadding / 2),
                  Image.asset(
                    widget.item.picture,
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    'Item needed: ' + widget.item.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Description: ' + widget.item.description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: kPrimaryColor,
                    child: const Text('Intereseted'),
                    onPressed: () {
                      final newChat = Chat(
                        id: chatsData.last.id + 1,
                        name: widget.item.name,
                        image: 'assets/images/profile_pic.jpeg',
                      );
                      final newMessage = ChatMessage(
                          id: chatsData.last.id,
                          text: 'Hello, I can provide what you need',
                          isSender: true);
                      setState(() {
                        chatsData.add(newChat);
                        messages.add(newMessage);
                      });
                    },
                  ),
                ],
                if (widget.item.isSender) ...[
                  const SizedBox(width: kDefaultPadding / 2),
                  Image.asset(
                    widget.item.picture,
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    'Item needed: ' + widget.item.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Description: ' + widget.item.description,
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
