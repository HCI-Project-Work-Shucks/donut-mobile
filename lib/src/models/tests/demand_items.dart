enum DemandType { service, food, nonFood }

class DemandItems {
  final String name, title, description, picture, time;
  final bool isSender;
  DemandType type;
  bool isPending;

  DemandItems({
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
  DemandItems(
    name: 'I have a donut',
    title: 'Donut',
    description: "I have too much donut i need give away some",
    picture: 'assets/images/donut_1.jpeg',
    isPending: true,
    time: '2022-07-22',
    type: DemandType.food,
  ),
  
  DemandItems(
    name: 'I donut can buy',
    title: 'Donut',
    description: "I can give donut",
    picture: 'assets/images/donut_2.jpeg',
    time: '2022-07-22',
    type: DemandType.service,
  ),
  DemandItems(
    name: 'Donut',
    title: 'Donut',
    description: "I  donut",
    picture: 'assets/images/donut_3.jpeg',
    isSender: true,
    time: '2022-07-22',
    type: DemandType.nonFood,
  ),
];
