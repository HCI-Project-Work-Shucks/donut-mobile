// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:donut/src/homepage/chat/chat.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);
  final value1 = 69;
  final value2 = 69;
  final value3 = 69;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, text: 'Completed', value: value1),
          buildDivider(),
          buildButton(context, text: 'Incompleted', value: value2),
          buildDivider(),
          buildButton(context, text: 'Pending', value: value3),
        ],
      );
  Widget buildDivider() => const SizedBox(
        height: 24,
        child: VerticalDivider(
          color: Colors.black,
        ),
      );
  Widget buildButton(BuildContext context,
          {required String text, required int value}) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$value',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
}