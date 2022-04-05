import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({Key? key}) : super(key: key);
  final username = 'I need a donut';
  final userpfp = 'assets/images/profile_pic.jpeg';

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          userPfp(),
          buildDivider(),
          buildButton(text: username),
        ],
      );

  Widget userPfp() {
    return Image.asset(
      userpfp,
      fit: BoxFit.cover,
      width: 50.0,
      height: 50.0,
    );
  }

  Widget buildDivider() => const SizedBox(
        height: 24,
        child: VerticalDivider(
          color: Colors.black,
        ),
      );

  Widget buildButton({required String text}) => MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
}
