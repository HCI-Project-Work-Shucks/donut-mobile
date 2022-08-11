// ignore_for_file: file_names
import 'dart:developer';

class Chat {
  final String name, image, item;
  final int id;
  bool isClosed;

  Chat({
    this.name = '',
    this.image = '',
    this.id = 0,
    required this.isClosed,
    this.item = '',
  });
}

List chatsData = [
  Chat(
    id: 0,
    name: "user_1",
    image: "assets/images/profile_pic.jpeg",
    isClosed: false,
    item: 'Donut',
  ),
  Chat(
      id: 1,
      name: "user_2",
      image: "assets/images/profile_pic.jpeg",
      isClosed: false,
      item: 'Donut Box'),
  Chat(
    id: 2,
    name: "user_3",
    image: "assets/images/profile_pic.jpeg",
    isClosed: false,
    item: 'Buy Donut',
  ),

];
