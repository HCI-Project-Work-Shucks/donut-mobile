import 'package:donut/src/homepage/notification/deal_cancelled.dart';
import 'package:donut/src/homepage/notification/deal_done.dart';
import 'package:donut/src/homepage/notification/interested.dart';
import 'package:flutter/material.dart';

import 'package:donut/src/models/tests/notifications.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({
    Key? key,
    required this.noticeType,
  }) : super(key: key);

  final Notice noticeType;
  @override
  Widget build(BuildContext context) {
    Widget messageContaint(Notice noticeType) {
      switch (noticeType.notificationType) {
        case NotificationType.DealMade:
          return const DealCancelledNotification();
        case NotificationType.DealCanceled:
          return const DealDone();
        case NotificationType.Interested:
          return const Interested();
        default:
          return const SizedBox();
      }
    }

    return Container();
  }
}
