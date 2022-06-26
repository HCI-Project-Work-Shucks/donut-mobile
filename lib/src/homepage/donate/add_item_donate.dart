// ignore_for_file: deprecated_member_use

import 'package:donut/src/models/tests/donate_items.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:donut/src/constants.dart';

class AddItemDonate extends StatefulWidget {
  const AddItemDonate({Key? key}) : super(key: key);

  @override
  _AddItemDonateState createState() => _AddItemDonateState();
}

class _AddItemDonateState extends State<AddItemDonate> {
  @override
  Widget build(BuildContext context) {
    const String username = 'Donut';
    String item = '';
    String description = '';
    String picture = '';

    File _image;

    final imagePicker = ImagePicker();

    Future getImage() async {
      final image = await imagePicker.getImage(
        source: ImageSource.camera,
      );
      setState(
        () {},
      );
    }

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
                'Enter the name of the item that you need',
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
                onSubmitted: ((text) => item = text),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Enter a brief description of why you need the item',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type here',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
                ),
                onSubmitted: ((text) => description = text),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Please provide a url to the picture of the item that you want',
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
                onPressed: getImage,
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
                  final donateitem = DonateItmes(
                    name: username,
                    title: item,
                    description: description,
                    picture: picture,
                    isSender: true,
                  );
                  setState(() => createItems.add(donateitem));
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
