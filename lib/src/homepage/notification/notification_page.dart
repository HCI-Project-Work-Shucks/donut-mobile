import 'package:donut/src/constants.dart';
import 'package:donut/src/homepage/notification/components/defaultAppBar.dart';
import 'package:donut/src/homepage/notification/components/defaultBackButton.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFFFFFF),
      body: FittedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color:  Color(0xFFFFFFFF),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [BoxShadow(color: Color(0xFF808080), blurRadius: 2.0)]),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(fontSize: 20.0,color: Colors.black)),
              SizedBox(height: 16.0),
              Image(image: AssetImage('flutter_application_1/assets/images/smallerjankman.png')),
              SizedBox(height: 16.0),
              const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text('11/Feb/2021 04:42 PM',
                    style: TextStyle(color: Colors.grey)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  State<Notice> createState() => _Notice();
}

class _Notice extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
