import 'package:flutter/material.dart';

import 'package:donut/src/homepage/profile/numberswidget.dart';
import 'package:donut/src/homepage/profile/textbox.dart';

class profileMain extends StatefulWidget {
  const profileMain({Key? key}) : super(key: key);

  @override
  State<profileMain> createState() => _profileMainState();
}

class _profileMainState extends State<profileMain> {
  final double coverHeight = 200;
  final double profileHeight = 144;
  final profileCover = 'assets/images/profile_bg.jpeg';
  final profileImage = 'assets/images/profile_pic.jpeg';

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
        Positioned(
          top: 500,
          child: buildTexting(),
        ),
      ],
    );
  }

  Widget buildProfileCover() => Container(
        color: Colors.pink[200],
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
        children: const [
          SizedBox(height: 8),
          Text(
            'I am a donut',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'I am a donut and I will give away all my donuts',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 16),
          NumbersWidget(),
          SizedBox(height: 16),
          Divider(
            color: Colors.black,
          ),
        ],
      );

  Widget buildTexting() => Column(
        children: const [
          Text(
            'Pending Deals: ',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          SizedBox(height: 8),
          TextBox(),
          Divider(),
          TextBox(),
        ],
      );
}
