// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';

class AddItemDemand extends StatelessWidget {
  const AddItemDemand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add item that you need'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Enter the name of the item that you can donate',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 10,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type here',
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Enter a brief description ofthe tiem and it's current condition",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type here',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Please provide a picture of the item that you can donate',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: FloatingActionButton(
                backgroundColor: kPrimaryColor,
                tooltip: 'Upload picture here',
                onPressed: () {},
                child: const Icon(
                  Icons.file_upload_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: kPrimaryColor,
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
