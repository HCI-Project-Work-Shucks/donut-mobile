import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class chat_detail extends StatefulWidget {
  const chat_detail({Key? key}) : super(key: key);

  @override
  State<chat_detail> createState() => _chat_detailState();
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

// ignore: camel_case_types
class _chat_detailState extends State<chat_detail> {
  List<Message> messages = [
    Message(
      text: 'Do you want to go out later today?',
      date: DateTime.now().subtract(
        const Duration(days: 3, minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'Hello?',
      date: DateTime.now().subtract(
        const Duration(days: 3, minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'Oops I missed the date',
      date: DateTime.now().subtract(
        const Duration(days: 1, minutes: 1),
      ),
      isSentByMe: true,
    ),
    Message(
      text: 'It is alright',
      date: DateTime.now().subtract(
        const Duration(days: 1, minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'There is always next year',
      date: DateTime.now().subtract(
        const Duration(days: 1, minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'Oh okay good then Im sorry for missing out',
      date: DateTime.now().subtract(
        const Duration(days: 1, minutes: 1),
      ),
      isSentByMe: true,
    ),
    Message(
      text: 'What did you do yesterday?',
      date: DateTime.now().subtract(
        const Duration(days: 1, minutes: 1),
      ),
      isSentByMe: true,
    ),
    Message(
      text: 'We partied all night',
      date: DateTime.now().subtract(
        const Duration(days: 1, minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'Must be fun',
      date: DateTime.now().subtract(
        const Duration(days: 1, minutes: 1),
      ),
      isSentByMe: true,
    ),
    Message(
      text: 'sorry for late reply i went to sleep last night',
      date: DateTime.now().subtract(
        const Duration(minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'But yes, It was very fun',
      date: DateTime.now().subtract(
        const Duration(minutes: 1),
      ),
      isSentByMe: false,
    ),
    Message(
      text: 'Hope I wont miss it again next year',
      date: DateTime.now().subtract(
        const Duration(minutes: 1),
      ),
      isSentByMe: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    String username = 'I need a donut';
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: const EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                      onSubmitted: (text) {
                        final message = Message(
                          text: text,
                          date: DateTime.now(),
                          isSentByMe: true,
                        );
                        setState(() => messages.add(message));
                        controller.text = "";
                      },
                      controller: controller,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
