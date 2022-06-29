import 'package:donut/src/constants.dart';
import 'package:donut/src/models/tests/message_test.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';
import 'package:donut/src/models/tests/chat.dart';

class Body extends StatelessWidget {
  int index;

  Body({required this.index});

  int count = 0;
  List Temp = [];

  void count_items() {
    for (var item in messages) {
      if (item.id == index) {
        count++;
        Temp.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    count_items();
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: count,
              itemBuilder: (context, index) => Message(
                message: Temp[index],
              ),
            ),
          ),
        ),
        ChatInputField(
          index: index,
        ),
      ],
    );
  }
}
