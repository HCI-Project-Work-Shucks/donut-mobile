import 'package:donut/src/models/tests/demand_items.dart';
import 'package:donut/src/models/tests/chat.dart';
import 'package:donut/src/models/tests/message_test.dart';
import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';

class DemandItemWidget extends StatefulWidget {
  final DemandItems item;
  const DemandItemWidget({
    Key? mykey,
    required this.item,
  }) : super(key: mykey);
  @override
  _DemandItemWidgetState createState() => _DemandItemWidgetState();
}

class _DemandItemWidgetState extends State<DemandItemWidget> {
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
                    'Item avaliable: ' + widget.item.title,
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
                  Text(
                    'time: ' + widget.item.time,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: kPrimaryColor,
                    child: const Text('Intereseted'),
                    onPressed: () {
                      widget.item.isPending = false;
                      final newChat = Chat(
                        id: chatsData.last.id + 1,
                        name: widget.item.name,
                        image: 'assets/images/profile_pic.jpeg',
                      );
                      final newMessage = ChatMessage(
                        id: chatsData.last.id,
                        text: 'Hello, I am interested in what you can provide',
                        isSender: true,
                      );
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
                    'Item available: ' + widget.item.title,
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
                  Text(
                    'time: ' + widget.item.time,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
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
