import 'package:donut/src/widgets/numbers_widget.dart';
import 'package:flutter/material.dart';
import 'package:donut/src/authorization/welcome_page.dart';
import 'package:donut/src/constants.dart';
import 'package:donut/src/models/tests/users.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ProfileMain extends StatefulWidget {
  int index;
  ProfileMain({Key? mykey, required this.index}) : super(key: mykey);
  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  late FocusNode _focusNode;
  final double coverHeight = 200;
  final double profileHeight = 120;
  final profileCover = 'assets/images/profile_bg_new.jpeg';
  late String profileImage = test_users[widget.index].profilePic;
  late String username = test_users[widget.index].name;
  late String description = test_users[widget.index].about;
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
        postdata();
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
          buildContent(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: logoutButton(context),
          )
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - bottom + 10;
    final nameLeft = profileHeight + 50;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildProfileCover(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, top, 0, 0),
          child: buildimage(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(nameLeft, top + 50, 0, 0),
          child: buildUsername(),
        ),
      ],
    );
  }

  postdata() async {
    var response = await http.post(Uri.parse(""), body: {
      "profileImage": profileImage,
      "description": description,
      "username": username,
    });
  }

  Widget buildProfileCover() => Container(
        color: kPrimaryColor,
        child: Image.asset(
          profileCover,
          width: double.infinity,
          height: coverHeight,
        ),
      );
  Widget buildimage() => Material(
        elevation: 4.0,
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage(profileImage),
          fit: BoxFit.fill,
          width: 120.0,
          height: 120.0,
          child: InkWell(
            onTap: () {},
          ),
        ),
      );

  Widget buildUsername() => Container(
        padding: const EdgeInsets.only(
          bottom:
              0.7, // This can be the space you need between text and underline
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 1.0, // This would be the width of the underline
            ),
          ),
        ),
        child: Text(
          username,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  // Widget buildProfileImage() => InkWell(
  //       borderRadius: BorderRadius.circular(25.0),
  //       onTap: () {
  //         pickImage(ImageSource.gallery);
  //       },
  //       child: Container(
  //         width: 70,
  //         height: 60,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         child: image != null
  //             ? Image.file(
  //                 image!,
  //                 width: 140.0,
  //                 height: 140.0,
  //                 fit: BoxFit.cover,
  //               )
  //             : Image.asset(
  //                 profileImage,
  //                 fit: BoxFit.cover,
  //                 width: 140.0,
  //                 height: 140.0,
  //               ),
  //       ),
  //     );
  Widget logoutButton(context) => RaisedButton(
        color: kSecondaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WelcomePage()),
          );
        },
        child: const Text(
          'Log Out?',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      );

  Widget buildDescription() => Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
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
            test_users[widget.index].about = text;
            _focusNode.unfocus();
            postdata();
          },
        ),
      );

  Widget buildContent(context) => Column(
        children: [
          const Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          buildDescription(),
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
          const SizedBox(height: 16),
          const Text('Donut, DOnate aNd Use Technology'),
          const SizedBox(height: 16),
        ],
      );
}
