import 'package:donut/src/widgets/numbers_widget.dart';
import 'package:flutter/material.dart';
import 'package:donut/src/constants.dart';
import 'package:donut/src/models/tests/users.dart';

class ProfileMain extends StatefulWidget {
  int index;
  ProfileMain({Key? mykey, required this.index}) : super(key: mykey);
  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  final double coverHeight = 200;
  final double profileHeight = 144;
  final profileCover = 'assets/images/profile_bg.jpeg';
  final profileImage = 'assets/images/profile_pic.jpeg';
  late String username = users[widget.index].name;
  late String description = users[widget.index].about;

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

  Widget buildProfileImage() => ClipOval(
        child: Image.asset(
          profileImage,
          fit: BoxFit.cover,
          width: 140.0,
          height: 140.0,
        ),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            username,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
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
