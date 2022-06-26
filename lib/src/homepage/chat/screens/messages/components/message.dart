import 'package:donut/src/models/tests/message_test.dart';
import 'package:donut/src/models/message.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'text_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      return TextMessage(message: message);
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: message.isSender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!message.isSender) ...[
                  const CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        AssetImage("assets/images/profile_pic.jpeg"),
                  ),
                  const SizedBox(width: kDefaultPadding / 2),
                  messageContaint(message),
                ],
                if (message.isSender) ...[
                  messageContaint(message),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
