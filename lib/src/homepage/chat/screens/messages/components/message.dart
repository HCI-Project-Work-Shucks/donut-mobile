import 'package:donut/src/models/tests/message_test.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: message.isSender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          messageContaint(message),
        ],
      ),
    );
  }
}
