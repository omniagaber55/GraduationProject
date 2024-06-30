import 'package:app/Components/CustomListChat.dart';
import 'package:app/Components/PersonChat.dart';
import 'package:app/constants.dart';
import 'package:app/veiws/chatPage.dart';
import 'package:flutter/material.dart';

class LIstViewChat extends StatefulWidget {
  const LIstViewChat({super.key});

  @override
  State<LIstViewChat> createState() => _LIstViewChatState();
}

class _LIstViewChatState extends State<LIstViewChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: White,
        title: const SizedBox(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Chat",
              style: TextStyle(
                color: PrimaryColor,
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: PrimaryColor),
          ),
        ),
      ),
      body: Column(
        children: [
          // Custom search input field
          ListChat(labelText: "Search"),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with actual item count
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    chatpage(), // Navigate to chatPage
                  ),
                );
                    },
                    child: Column(
                      children: [
                        // Replace with actual chat person details
                        PersonChat(
                          name: "Dina Ali Saleh",
                          image: "assets/images/Chat.png",
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
