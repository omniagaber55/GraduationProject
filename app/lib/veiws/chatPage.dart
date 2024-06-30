import 'package:app/constants.dart';
import 'package:app/veiws/ListVeiwChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';


class chatpage extends StatefulWidget {
  final User _user;
    chatpage( this._user);
              
  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
 final List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
    void initState() {
    super.initState();
    _addMessage(types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: UniqueKey().toString(),
      text: widget._user.email,
    ));
  }
@override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(title:  Row(
  children: [
    Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.cyan),
                            child: const Padding(
                              padding: EdgeInsets.all(.5), // stroke
                              child: CircleAvatar(
                                radius: 23,
                                backgroundColor: Colors.white,
                                child: Image(
                                  image: AssetImage('assets/images/Chat.png'),
                                ),
                                // resize radius
                              ),
                            ),
                          ), SizedBox(width: 20,),
Text(widget._user.name)  ],
),),
      body:
      Chat(
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