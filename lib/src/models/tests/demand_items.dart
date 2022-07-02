class DemandItems {
  final String name, title, description, picture, time;
  final bool isSender;

  DemandItems({
    this.name = '',
    this.title = '',
    this.description = '',
    this.picture = '',
    this.isSender = false,
    this.time = '',
  });
}

List createItems = [
  DemandItems(
    name: 'I have a donut',
    title: 'Donut',
    description: "I have too much donut i need give away some",
    picture: 'assets/images/profile_pic.jpeg',
  ),
  DemandItems(
    name: 'I donut give',
    title: 'Donut',
    description: "I can give donut",
    picture: 'assets/images/profile_pic.jpeg',
  ),
  DemandItems(
    name: 'Donut',
    title: 'Donut',
    description: "I  donut",
    picture: 'assets/images/profile_pic.jpeg',
    isSender: true,
  ),
];
