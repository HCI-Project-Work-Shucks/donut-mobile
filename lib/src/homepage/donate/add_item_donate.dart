// ignore_for_file: deprecated_member_use

import 'package:donut/src/models/tests/donate_items.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:donut/src/constants.dart';

class AddItemDonate extends StatefulWidget {
  const AddItemDonate({Key? key}) : super(key: key);

  @override
  _AddItemDonateState createState() => _AddItemDonateState();
}

class _AddItemDonateState extends State<AddItemDonate> {
  File? image;
  late String imgUrl;

  @override
  Widget build(BuildContext context) {
    const String username = 'Donut';
    String item = '';
    String description = '';
    String picture = '';
    bool isSelected = false;
    DonateType itemType = DonateType.food;

    postdata() async {
      try {
        var response = await http.post(
          Uri.parse(""),
          body: {
            "name": username,
            "item": item,
            "description": description,
            "picture": picture,
          },
        );
      } catch (e) {
        print(e);
      }
    }

    Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;

        final imageTemporary = File(image.path);
        setState(() {
          picture = image.path;
          print(picture);
          this.image = imageTemporary;
          postdata();
        });
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    Widget uploadButton() => FloatingActionButton(
          backgroundColor: kSecondaryColor,
          tooltip: 'Upload picture here',
          onPressed: () {
            pickImage(ImageSource.camera);
          },
          child: const Icon(
            Icons.file_upload_outlined,
            color: Colors.purple,
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
                'Enter the name of the item that you need',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
                  fontWeight: FontWeight.bold,
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
                onSubmitted: ((text) => description = text),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                'Please select the category of what you need',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: kSecondaryColor,
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                        itemType = DonateType.service;
                      });
                    },
                    child: const Text(
                      'Service',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: kSecondaryColor,
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                        itemType = DonateType.food;
                      });
                    },
                    child: const Text(
                      'Food',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: kSecondaryColor,
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                        itemType = DonateType.nonFood;
                      });
                    },
                    child: const Text(
                      'Non Food',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.purple,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Please provide a picture of the item that you want',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: image == null
                  ? uploadButton()
                  : Image.file(
                      image!,
                      width: 500,
                      height: 300,
                    ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                color: kSecondaryColor,
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.purple,
                  ),
                ),
                onPressed: () {
                  postdata();
                  var now = DateTime.now();
                  var formatter = DateFormat('yyyy-MM-dd');
                  String formattedDate = formatter.format(now);
                  final donateitem = DonateItmes(
                    name: username,
                    title: item,
                    picture: picture,
                    description: description,
                    isSender: true,
                    time: formattedDate,
                    type: itemType,
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
