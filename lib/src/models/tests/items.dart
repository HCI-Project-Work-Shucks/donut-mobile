class Itmes {
  final String name, title, description, picture, time;
  final bool isPending, isSender;

  Itmes({
    this.name = '',
    this.title = '',
    this.description = '',
    this.picture = '',
    this.time = '',
    this.isPending = false,
    this.isSender = false,
  });
}

List createItems = [
  Itmes(
    name: 'I need a donut',
    title: 'Donut',
    description:
        "I don't have money to buy a donut so i need one right now, like right now",
    picture: '',
    time: '10 years ago',
    isPending: true,
  ),
  Itmes(
    name: 'I need donut',
    title: 'Donut',
    description: "I want donut",
    picture: '',
    time: '1 day ago',
    isPending: false,
  ),
  Itmes(
    name: 'Need a donut',
    title: 'Donut',
    description: "I need donut",
    picture: '',
    time: '1 second ago',
    isPending: false,
    isSender: true,
  ),
];
