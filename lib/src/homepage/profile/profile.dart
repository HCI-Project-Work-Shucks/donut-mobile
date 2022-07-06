import 'package:donut/src/widgets/numbers_widget.dart';
import 'package:flutter/material.dart';
import 'package:donut/src/constants.dart';
import 'package:donut/src/models/tests/users.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ProfileMain extends StatefulWidget {
  int index;
  ProfileMain({Key? mykey, required this.index}) : super(key: mykey);
  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  late FocusNode _focusNode;
  final double coverHeight = 200;
  final double profileHeight = 144;
  final profileCover = 'assets/images/profile_bg.jpeg';
  late String profileImage = users[widget.index].profilePic;
  late String username = users[widget.index].name;
  late String description = users[widget.index].about;
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanentaly(image.path);
      setState(() {
        // ignore: unnecessary_null_comparison
        imagePermanent != null ? profileImage = imagePermanent : null;
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<String> saveImagePermanentaly(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    String newimage = image.path;

    return newimage;
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - bottom;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildProfileCover(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildProfileCover() => Container(
        color: kPrimaryColor,
        child: Image.asset(
          profileCover,
          width: double.infinity,
          height: coverHeight,
        ),
      );

  Widget buildProfileImage() => InkWell(
        child: image != null
            ? Image.file(
                image!,
                width: 140.0,
                height: 140.0,
              )
            : Image.asset(
                profileImage,
                fit: BoxFit.cover,
                width: 140.0,
                height: 140.0,
              ),
        onTap: () {
          pickImage(ImageSource.gallery);
        },
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            username,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              initialValue: description,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              focusNode: _focusNode,
              autofocus: false,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(border: InputBorder.none),
              textAlign: TextAlign.center,
              onFieldSubmitted: (text) {
                users[widget.index].about = text;
                _focusNode.unfocus();
              },
            ),
          ),
          const SizedBox(height: 16),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          NumbersWidget(
            index: widget.index,
          ),
          const SizedBox(height: 16),
          const Divider(
            color: Colors.black,
          ),
        ],
      );
}
