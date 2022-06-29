class ChatMessage {
  final String text;
  final int id;
  final bool isSender;

  ChatMessage({
    this.text = '',
    this.id = 0,
    required this.isSender,
  });
}

List messages = [
  ChatMessage(
    id: 0,
    text: "Hello I am a donut",
    isSender: false,
  ),
  ChatMessage(
    id: 0,
    text: "Hello, How are you?",
    isSender: true,
  ),
  ChatMessage(
    id: 0,
    text: "I need a donut",
    isSender: false,
  ),
  ChatMessage(
    id: 0,
    text: "okay sure no problem",
    isSender: true,
  ),
  ChatMessage(
    id: 1,
    text: "Hello ",
    isSender: true,
  ),
  ChatMessage(
    id: 1,
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatMessage(
    id: 1,
    text: "Glad you like it",
    isSender: true,
  ),
];
