import 'dart:convert';

import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'chatPage.dart';

class LIstViewChat extends StatefulWidget {
  const LIstViewChat({super.key});

  @override
  State<LIstViewChat> createState() => _LIstViewChatState();
}

class _LIstViewChatState extends State<LIstViewChat> {
  List<User> _users = [];
  List<User> _searchResults = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchChats();
  }

  Future<void> _fetchChats() async {
    final token = 'your_bearer_token_here';
    final response = await http.get(
      Uri.parse('https://your_api_endpoint_here/api/show-chats'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    print('Response status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final chats = jsonData['chats'];
      setState(() {
        _users = chats.map((chat) => User(
          id: chat['id'],
          name: chat['sender_name'],
          email: chat['receiver_name'],
        )).toList();
        _searchResults = _users;
      });
    } else {
      throw Exception('Failed to load chats');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFFFFFF),
        title: const SizedBox(
          child: Text(
            "Chat",
            style: TextStyle(color: PrimaryColor, fontSize: 32),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
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
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.teal,
                      ),
                      hintStyle: const TextStyle(
                          color: Colors.teal,
                          fontSize: 24,
                          fontWeight: FontWeight.w300),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(color: Color(0xffF6F4F4))),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Color(0xffF6F4F4),
                          )),
                    ),
                    onChanged: (value) {
                      _search(value);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => chatpage(_searchResults[index]),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Container(
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
                      ),
                      title: Text(_searchResults[index].name),
                      subtitle: Text(_searchResults[index].email),
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

  void _search(String query) {
    setState(() {
      _searchResults = _users
          .where((user) =>
          user.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}