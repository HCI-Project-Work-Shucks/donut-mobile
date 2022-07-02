// ignore_for_file: deprecated_member_use, unnecessary_null_comparison
import 'dart:io';
import 'package:donut/src/models/tests/demand_items.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:donut/src/constants.dart';

class AddItemDemand extends StatefulWidget {
  const AddItemDemand({Key? key}) : super(key: key);

  @override
  _AddItemDemandState createState() => _AddItemDemandState();
}

class _AddItemDemandState extends State<AddItemDemand> {
  @override
  Widget build(BuildContext context) {
    const String username = 'Donut';
    String item = '';
    String description = '';
    String picture = '';
    File? _image;

    final imagePicker = ImagePicker();

    Future getImage() async {
      final image = await imagePicker.getImage(
        source: ImageSource.camera,
      );
      setState(
        () {
          _image = File(image!.path);
          picture = image as String;
        },
      );
    }

    Widget button() => FloatingActionButton(
          backgroundColor: kPrimaryColor,
          tooltip: 'Upload picture here',
          onPressed: getImage,
          child: const Icon(
            Icons.file_upload_outlined,
            color: Colors.white,
            size: 30.0,
          ),
        );

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
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type here',
                ),
                onSubmitted: (text) {
                  item = text;
                },
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
              width: 10,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type here',
                ),
                onSubmitted: (text) {
                  description = text;
                },
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
              child: _image == null
                  ? button()
                  : Image.file(
                      _image!,
                      width: 100,
                      height: 100,
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
                  var now = DateTime.now();
                  var formatter = DateFormat('yyyy-MM-dd');
                  String formattedDate = formatter.format(now);
                  final demanditem = DemandItems(
                    name: username,
                    title: item,
                    description: description,
                    picture: 'assets/images/profile_pic.jpeg',
                    isSender: true,
                    time: formattedDate,
                  );
                  setState(() => createItems.add(demanditem));
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
