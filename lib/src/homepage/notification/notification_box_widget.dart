import 'package:flutter/material.dart';

import 'package:donut/src/constants.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    Key? key,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    String username = 'I need a donut';

    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: const [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/profile_pic.jpeg'),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    const Opacity(
                      opacity: 0.64,
                      child: Text(
                        'There is someone who want to make a deal with you',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text('3 seconds ago'),
            ),
          ],
        ),
      ),
    );
  }
}
