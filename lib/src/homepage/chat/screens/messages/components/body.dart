import 'package:donut/src/constants.dart';
import 'package:donut/src/models/tests/message_test.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  int index;

  Body({Key? key, required this.index}) : super(key: key);

  int count = 0;
  // ignore: non_constant_identifier_names
  List Temp = [];

  // ignore: non_constant_identifier_names
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
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
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
      ),
    );
  }
}
