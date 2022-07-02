import 'package:donut/src/models/tests/message_test.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants.dart';
import 'dart:io';

// ignore: must_be_immutable
class ChatInputField extends StatefulWidget {
  int index;
  ChatInputField({Key? mykey, required this.index}) : super(key: mykey);
  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final FocusNode node = FocusNode();

  @override
  Widget build(BuildContext context) {
    File _image;

    final imagePicker = ImagePicker();

    Future getImage() async {
      final image = await imagePicker.getImage(
        source: ImageSource.camera,
      );
      setState(
        () {},
      );
    }

    final TextEditingController controller = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SafeArea(
        child: Row(
          children: [
            const SizedBox(width: kDefaultPadding),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        focusNode: node,
                        decoration: const InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                        onSubmitted: (text) {
                          final message = ChatMessage(
                            id: widget.index,
                            text: text,
                            isSender: true,
                          );
                          setState(() => messages.add(message));
                          controller.text = "";
                        },
                        controller: controller,
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding / 4),
                    ElevatedButton(
                      onPressed: getImage,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.64),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
