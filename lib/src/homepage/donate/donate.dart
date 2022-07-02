// ignore_for_file: deprecated_member_use, unused_field

import 'package:donut/src/homepage/donate/donate_items_widget.dart';
import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';
import 'add_item_donate.dart';
import 'package:donut/src/models/tests/donate_items.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({Key? key}) : super(key: key);

  @override
  _DonatePage createState() => _DonatePage();
}

class _DonatePage extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('donate page'),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: createItems.length,
              itemBuilder: (context, index) =>
                  DonateItemWidget(item: createItems[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemDonate()),
          );
        },
        tooltip: 'Add item that you want to donate',
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
