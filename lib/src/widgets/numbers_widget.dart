// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:donut/src/models/tests/users.dart';

class NumbersWidget extends StatelessWidget {
  int index;
  NumbersWidget({Key? key, required this.index}) : super(key: key);
  late int value1 = test_users[index].completedDeals;
  late int value2 = test_users[index].pendingDeals;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(text: 'Completed', value: value1),
          buildDivider(),
          buildButton(text: 'Pending', value: value2),
        ],
      );

  Widget buildDivider() => const SizedBox(
        height: 24,
        child: VerticalDivider(
          color: Colors.black,
        ),
      );

  Widget buildButton({required String text, required int value}) =>
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
