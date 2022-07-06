// ignore_for_file: file_names

class Chat {
  final String name, image;
  final int id;
  final bool isClosed;

  Chat({
    this.name = '',
    this.image = '',
    this.id = 0,
    required this.isClosed,
  });
}

List chatsData = [
  Chat(
      id: 1,
      name: "user_1",
      image: "assets/images/profile_pic.jpeg",
      isClosed: false),
  Chat(
      id: 2,
      name: "user_2",
      image: "assets/images/profile_pic.jpeg",
      isClosed: false),
  Chat(
      id: 3,
      name: "user_3",
      image: "assets/images/profile_pic.jpeg",
      isClosed: false),
];
