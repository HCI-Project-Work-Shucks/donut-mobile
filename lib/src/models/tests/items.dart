class Itmes {
  final String name, description, time;
  final bool isPending;

  Itmes({
    this.name = '',
    this.description = '',
    this.time = '',
    this.isPending = false,
  });
}

List CreateItems = [
  Itmes(
    name: 'I need a donut',
    description:
        "I don't have money to buy a donut so i need one right now, like right now",
    time: '10 years ago',
    isPending: true,
  ),
  Itmes(
    name: 'I need donut',
    description: "I want donut",
    time: '1 day ago',
    isPending: false,
  ),
  Itmes(
    name: 'Need a donut',
    description: "I need donut",
    time: '1 second ago',
    isPending: false,
  ),
];
