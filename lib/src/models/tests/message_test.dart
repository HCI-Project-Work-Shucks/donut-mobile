class ChatMessage {
  final String text;
  final bool isSender;

  ChatMessage({
    this.text = '',
    required this.isSender,
  });
}

List Messages = [
  ChatMessage(
    text: "Hi Sajol,",
    isSender: false,
  ),
  ChatMessage(
    text: "Hello, How are you?",
    isSender: true,
  ),
  ChatMessage(
    text: "hehe",
    isSender: false,
  ),
  ChatMessage(
    text: "yeet",
    isSender: true,
  ),
  ChatMessage(
    text: "Error happend",
    isSender: true,
  ),
  ChatMessage(
    text: "This looks great man!!",
    isSender: false,
  ),
  ChatMessage(
    text: "Glad you like it",
    isSender: true,
  ),
];
