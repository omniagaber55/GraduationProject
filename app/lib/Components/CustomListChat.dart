import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class ListChat extends StatefulWidget {
  ListChat({this.labelText});
  String? labelText;
  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  final _ChatController = TextEditingController();
  void dispose() {
    super.dispose();
    _ChatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffF6F4F4),
                borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            width: 468,
            height: 59,
            child: TextFormField(
              controller: _ChatController,
              decoration: InputDecoration(
                hintText: widget.labelText,
                prefixIcon: Icon(
                  Icons.search,
                  color: PrimaryColor,
                ),
                hintStyle: const TextStyle(
                  color: PrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w300
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xffF6F4F4))),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                      color: Color(0xffF6F4F4),
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
