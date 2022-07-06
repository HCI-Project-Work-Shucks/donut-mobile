// ignore: file_names
import 'package:donut/src/models/tests/chat.dart';
import 'package:flutter/material.dart';
import 'package:donut/src/homepage/chat/screens/chats/chats_screen.dart';
import 'package:donut/src/models/tests/users.dart';

// ignore: must_be_immutable
class Button extends StatefulWidget {
  int index;
  Button({Key? key, required this.index}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.done),
      onPressed: () {
        if (users[widget.index].pendingDeals != 0) {
          users[widget.index].pendingDeals--;
          print(users[widget.index].pendingDeals);
          print('yeet');
        } else {
          print('error below 0');
        }
        users[widget.index].completedDeals++;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatsScreen(),
          ),
        );
      },
    );
  }
}
