// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';
import 'add_item_demand.dart';
import 'package:donut/src/models/tests/demand_items.dart';

import 'package:donut/src/homepage/demand/demand_items_widget.dart';

class DemandPage extends StatefulWidget {
  const DemandPage({Key? key}) : super(key: key);

  @override
  _DemandPage createState() => _DemandPage();
}

class _DemandPage extends State<DemandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'demand page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddItemDemand()),
              );
            },
            tooltip: 'Add item that you want to donate',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: createItems.length,
              itemBuilder: (context, index) =>
                  DemandItemWidget(item: createItems[index]),
            ),
          ),
        ],
      ),
    );
  }
}
