enum DonateType { service, food, nonFood }

class DonateItmes {
  final String name, title, description, picture, time;
  final bool isSender;
  DonateType type;
  bool isPending;
  DonateItmes({
    this.name = '',
    this.title = '',
    this.description = '',
    this.picture = '',
    this.isSender = false,
    this.isPending = false,
    this.time = '',
    required this.type,
  });
}

List createItems = [
  DonateItmes(
    name: 'I need a donut',
    title: 'Donut',
    description:
        "I don't have money to buy a donut so i need one right now, like right now",
    picture: 'assets/images/donut_1.jpeg',
    time: '2019-01-22',
    type: DonateType.food,
  ),
  DonateItmes(
    name: 'I need service',
    title: 'Donut delivery service',
    description: "I need someone to help me buy a donut please",
    picture: 'assets/images/donut_1.jpeg',
    time: '2019-01-22',
    type: DonateType.service,
  ),
  DonateItmes(
    name: 'I need a donut box',
    title: 'Donut Box',
    description: "I want donut box",
    picture: 'assets/images/donut_2.jpeg',
    time: '2019-01-22',
    isPending: true,
    type: DonateType.nonFood,
  ),
  DonateItmes(
    name: 'Need a donut',
    title: 'Delicious donuts',
    description: "I need donut",
    picture: 'assets/images/donut_3.jpeg',
    time: '2019-01-22',
    isSender: true,
    type: DonateType.food,
  ),
];
