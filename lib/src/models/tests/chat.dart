// ignore_for_file: file_names

class Chat {
  final String name, image;
  final int id;

  Chat({
    this.name = '',
    this.image = '',
    this.id = 0,
  });
}

List chatsData = [
  Chat(
    id: 1,
    name: "mark",
    image: "assets/images/profile_pic.jpeg",
  ),
  Chat(
    id: 2,
    name: "mock",
    image: "assets/images/profile_pic.jpeg",
  ),
  Chat(
    id: 3,
    name: "cow",
    image: "assets/images/profile_pic.jpeg",
  ),
  Chat(
    id: 4,
    name: "moo",
    image: "assets/images/profile_pic.jpeg",
  ),
  Chat(
    id: 5,
    name: "donut",
    image: "assets/images/profile_pic.jpeg",
  ),
  Chat(
    id: 6,
    name: "yeet",
    image: "assets/images/profile_pic.jpeg",
  ),
];
