enum NotificationType { DealMade, DealCanceled, Interested }

class Notice {
  final String sender, date;
  final NotificationType notificationType;

  Notice({
    this.date = '',
    this.sender = '',
    required this.notificationType,
  });
}

List NoticeItems = [
  Notice(
    sender: 'I needed a Donut',
    date: '5mins ago',
    notificationType: NotificationType.DealMade,
  ),
  Notice(
    sender: 'I need a Donut',
    date: '5mins ago',
    notificationType: NotificationType.Interested,
  ),
  Notice(
    sender: 'I still need a Donut',
    date: '5mins ago',
    notificationType: NotificationType.DealCanceled,
  )
];
