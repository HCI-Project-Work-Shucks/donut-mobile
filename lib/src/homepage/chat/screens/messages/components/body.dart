import 'package:donut/src/constants.dart';
import 'package:donut/src/models/tests/message_test.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: Messages.length,
              itemBuilder: (context, index) =>
                  Message(message: Messages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
