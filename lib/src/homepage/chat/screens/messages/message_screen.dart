import 'package:donut/src/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'package:donut/src/models/tests/chat.dart';

import 'package:donut/src/homepage/chat/screens/messages/components/appBarButton.dart';


class MessagesScreen extends StatelessWidget {
  int index;

  MessagesScreen({required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(
        index: index,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile_pic.jpeg"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chatsData[index].name,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
      actions: [
        Button(index: index),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
