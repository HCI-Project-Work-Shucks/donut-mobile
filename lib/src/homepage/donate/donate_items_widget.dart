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
  Widget pending() {
    return RaisedButton(
      textColor: Colors.purple,
      color: kSecondaryColor,
      child: const Text(
        'Pending',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: () {},
    );
  }

  Widget interested() {
    return RaisedButton(
      textColor: Colors.purple,
      color: kSecondaryColor,
      child: const Text(
        'Interested',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: () {
        widget.item.isPending = true;
        final newChat = Chat(
            id: chatsData.last.id + 1,
            name: widget.item.name,
            image: 'assets/images/profile_pic.jpeg',
            item: widget.item.name,
            isClosed: false);
        final newMessage = ChatMessage(
            id: chatsData.last.id,
            text: 'Hello, I can provide what you need',
            isSender: true);
        setState(
          () {
            chatsData.add(newChat);
            messages.add(newMessage);
          },
        );
      },
    );
  }

  String itemType() {
    String text;
    if (widget.item.type == DonateType.food) {
      text = 'Food';
    } else if (widget.item.type == DonateType.nonFood) {
      text = 'Non Food';
    } else {
      text = 'Service';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: widget.item.isSender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (!widget.item.isSender) ...[
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/images/profile_pic.jpeg"),
                        ),
                        Text(
                          '  ' + widget.item.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Image.asset(
                      widget.item.picture,
                      height: 200,
                      width: 400,
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Item needed:   ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.item.title,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Type:   ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          itemType(),
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom:
                            0.7, // This can be the space you need between text and underline
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width:
                                1.0, // This would be the width of the underline
                          ),
                        ),
                      ),
                      child: const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Text(
                      widget.item.description,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'time: ' + widget.item.time,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    if (!widget.item.isPending) ...[interested()],
                    if (widget.item.isPending) ...[pending()],
                  ],
                  if (widget.item.isSender) ...[
                    const Text(
                      'This post is by you!',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding / 2),
                    Image.asset(
                      widget.item.picture,
                      height: 200,
                      width: 400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Item needed:   ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.item.title,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Type:   ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          itemType(),
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom:
                            0.7, // This can be the space you need between text and underline
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width:
                                1.0, // This would be the width of the underline
                          ),
                        ),
                      ),
                      child: const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.item.description,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Time: ' + widget.item.time,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
