import 'package:donut/src/models/tests/message_test.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

import '../../../../../constants.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  Widget buildTextIsSender() => BubbleSpecialThree(
        text: message!.text,
        color: kPrimaryColor,
        tail: true,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      );

  Widget buildTextNotSender() => BubbleSpecialThree(
        text: message!.text,
        color: const Color(0xFFE8E8EE),
        tail: true,
        isSender: false,
      );

  @override
  Widget build(BuildContext context) {
    if (message!.isSender == true) {
      return buildTextIsSender();
    } else {
      return buildTextNotSender();
    }
    // return Container(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: kDefaultPadding * 0.75,
    //     vertical: kDefaultPadding / 2,
    //   ),
    //   decoration: BoxDecoration(
    //     color: kPrimaryColor.withOpacity(message!.isSender ? 1 : 0.1),
    //     borderRadius: BorderRadius.circular(30),
    //   ),
    //   child: Text(
    //     message!.text,
    //     style: TextStyle(
    //       color: message!.isSender
    //           ? Colors.white
    //           : Theme.of(context).textTheme.bodyText1!.color,
    //     ),
    //   ),
    // );
  }
}
