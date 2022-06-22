class DonateItmes {
  final String name, title, description, picture;
  final bool isSender;

  DonateItmes({
    this.name = '',
    this.title = '',
    this.description = '',
    this.picture = '',
    this.isSender = false,
  });
}

List createItems = [
  DonateItmes(
    name: 'I need a donut',
    title: 'Donut',
    description:
        "I don't have money to buy a donut so i need one right now, like right now",
    picture: 'assets/images/profile_pic.jpeg',
  ),
  DonateItmes(
    name: 'I need donut',
    title: 'Donut',
    description: "I want donut",
    picture: 'assets/images/profile_pic.jpeg',
  ),
  DonateItmes(
    name: 'Need a donut',
    title: 'Donut',
    description: "I need donut",
    picture: 'assets/images/profile_pic.jpeg',
    isSender: true,
  ),
];
