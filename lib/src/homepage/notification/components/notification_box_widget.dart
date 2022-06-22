import 'package:flutter/material.dart';
import 'package:donut/src/homepage/notification/notification_page.dart';
import 'package:donut/src/constants.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function onTap;
  final bool enable;
  const NotificationTiles({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0,
          width: 50.0,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/smallerjankman.png'),
                  fit: BoxFit.cover))),
      title: Text(title, style: TextStyle(color: Colors.black)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
      //onTap: onTap,
      enabled: enable,
    );
  }
}
