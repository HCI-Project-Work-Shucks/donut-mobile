// ignore_for_file: deprecated_member_use, unnecessary_null_comparison
import 'dart:io';
import 'package:donut/src/models/tests/demand_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:donut/src/constants.dart';

class AddItemDemand extends StatefulWidget {
  const AddItemDemand({Key? key}) : super(key: key);

  @override
  _AddItemDemandState createState() => _AddItemDemandState();
}

class _AddItemDemandState extends State<AddItemDemand> {
  File? image;
  @override
  Widget build(BuildContext context) {
    const String username = 'Donut';
    String item = '';
    String description = '';
    String picture = '';
    DemandType itemType = DemandType.food;
    bool isSelected = false;

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
          this.image = imageTemporary;
          picture = image.path;
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
        title: const Text(
          'Add item that you need',
        ),
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
                        itemType = DemandType.service;
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
                        itemType = DemandType.food;
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
                        itemType = DemandType.nonFood;
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
                'Please provide a picture of the item that you can donate',
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
                  var now = DateTime.now();
                  var formatter = DateFormat('yyyy-MM-dd');
                  String formattedDate = formatter.format(now);
                  final demanditem = DemandItems(
                    name: username,
                    title: item,
                    description: description,
                    picture: picture,
                    isSender: true,
                    type: itemType,
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
