class DonateItmes {
  final String name, title, description, picture, time;
  final bool isSender;

  DonateItmes({
    this.name = '',
    this.title = '',
    this.description = '',
    this.picture = '',
    this.isSender = false,
    this.time = '',
  });
}

List createItems = [
  DonateItmes(
    name: 'I need a donut',
    title: 'Donut',
    description:
        "I don't have money to buy a donut so i need one right now, like right now",
    picture: 'assets/images/profile_pic.jpeg',
    time: '2019-01-22',
  ),
  DonateItmes(
    name: 'I need donut',
    title: 'Donut',
    description: "I want donut",
    picture: 'assets/images/profile_pic.jpeg',
    time: '2019-01-22',
  ),
  DonateItmes(
    name: 'Need a donut',
    title: 'Donut',
    description: "I need donut",
    picture: 'assets/images/profile_pic.jpeg',
    time: '2019-01-22',
    isSender: true,
  ),
];
