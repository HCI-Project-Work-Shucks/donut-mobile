// ignore: file_names
import 'package:flutter/material.dart';
import 'package:donut/src/homepage/chat/screens/chats/chats_screen.dart';
import 'package:donut/src/models/tests/chat.dart';

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
        chatsData[widget.index].isClosed = true;
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
