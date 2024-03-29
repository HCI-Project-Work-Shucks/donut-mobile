import 'package:donut/src/models/tests/chat.dart';
import 'package:donut/src/homepage/chat/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';

import 'chat_card.dart';

class Body extends StatelessWidget {
  int count = 0;
  List Temp = [];

  void count_items() {
    for (var item in chatsData) {
      if (item.isClosed == false) {
        count++;
        Temp.add(item);
      }
    }
  }

  Widget build(BuildContext context) {
    count_items();
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: ListView.builder(
              itemCount: Temp.length,
              itemBuilder: (context, index) => ChatCard(
                chat: Temp[index],
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessagesScreen(
                        index: Temp[index].id,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
