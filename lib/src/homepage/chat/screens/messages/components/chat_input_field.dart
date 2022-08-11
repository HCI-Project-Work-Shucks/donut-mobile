import 'package:donut/src/models/tests/message_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  File? image;

  @override
  Widget build(BuildContext context) {
    final imagePicker = ImagePicker();
    String picture = '';

    Future pickImage(ImageSource source) async {
      try {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;

        final imageTemporary = File(image.path);
        setState(() {
          this.image = imageTemporary;
          picture = image.path;
        });
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    Widget uploadButton() => RaisedButton(
          // ignore: prefer_const_constructors
          color: kSecondaryColor,

          onPressed: () {
            pickImage(ImageSource.camera);
            final message = ChatMessage(
              id: widget.index,
              text: picture,
              isSender: true,
            );
            setState(() => messages.add(message));
          },
          child: Icon(
            Icons.camera_alt_outlined,
            size: 25,
            color:
                Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.64),
          ),
        );

    final TextEditingController controller = TextEditingController();

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        focusNode: node,
                        decoration: const InputDecoration(
                          // filled: true,
                          // fillColor: Colors.green,
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            uploadButton()
          ],
        ),
      ),
    );
  }
}
