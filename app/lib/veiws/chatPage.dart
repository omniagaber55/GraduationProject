import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';


class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
 final List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: _user,
        theme: Defultmessage())
    );

  }

  DefaultChatTheme Defultmessage() {
    return DefaultChatTheme(
      inputTextCursorColor: PrimaryColor,
      inputSurfaceTintColor: PrimaryColor,
      inputBackgroundColor: Colors.white,
      inputTextColor:Colors.black,
      inputMargin:
      const EdgeInsets.symmetric (horizontal: 40, vertical: 15), inputTextStyle: const TextStyle(

          color: Colors.black,),
  inputBorderRadius: const BorderRadius.horizontal(

  left: Radius.circular (10),
  right: Radius.circular(10), ),
  inputContainerDecoration: BoxDecoration(

  color: Colors.white,
  border: Border.all(color:PrimaryColor, width: 1.8), borderRadius: const BorderRadius.horizontal(

  left: Radius.circular (10),
  right: Radius.circular(10),
  ),
  ),
  primaryColor: PrimaryColor,
  backgroundColor: const Color.fromARGB(255, 227, 227, 227));
  }
  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: UniqueKey().toString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }
  void _addMessage(types.Message message) {
    print("Adding Message $message");
    setState(() {
      _messages.insert(0, message);
    });
  }
}