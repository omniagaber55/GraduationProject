import 'dart:convert';
import 'dart:io';

import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;

class Notifications extends StatefulWidget {
  const Notifications({Key? key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  File? _imageFile;
  String? _predictionMessage;

  @override
  void initState() {
    super.initState();
    // Load the image and send it to server on initialization
    _loadImageFromPath();
  }

  Future<void> _loadImageFromPath() async {
    // Replace this with your local image path
    String imagePath = 'assets/images/card.jpeg';

    setState(() {
      _imageFile = File(imagePath);
    });

    await _sendImageToServer(_imageFile!);
  }

  Future<void> _sendImageToServer(File imageFile) async {
    final url = Uri.parse(
        'https://miserably-current-lioness.ngrok-free.app/classify?image='); // Replace with your API endpoint
    var request = http.MultipartRequest('POST', url);
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        // Process successful response
        final responseBody = await response.stream.bytesToString();
        final decoded = jsonDecode(responseBody);
        setState(() {
          _predictionMessage = '  There is a foreign body that harm the device';
        });
      } else {
        setState(() {
          _predictionMessage = null; // Remove _predictionMessage on failure
        });
      }
    } catch (e) {
      setState(() {
        _predictionMessage = null; // Remove _predictionMessage on error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 26,
                      color: PrimaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/clarity_notification-solid-badged.png",
                ),
                const Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 32,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "New",
                  style: TextStyle(
                    fontSize: 24,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            NotificationElement(
              image1: "assets/icons/icon.png",
              text: " The gas percentage reached 30 %.",
              clock: "02:20 pm",
            ),
            const SizedBox(
              height: 20,
            ),
            NotificationElement(
              image1: "assets/icons/icon2.png",
              text: " The gas percentage reached 100 %.",
              clock: "02:20 pm",
            ),
            const SizedBox(
              height: 20,
            ),
            NotificationElement(
              image1: "assets/icons/Vector3.png",
              text: "  The device's usage period has almost expired.",
              clock: "02:20 pm",
            ),
            const SizedBox(
              height: 20,
            ),
            NotificationElement(
              image1: "assets/icons/Group5.png",
              text: "You have new messages, go to chat.",
              clock: "02:20 pm",
            ),
            const SizedBox(
              height: 20,
            ),
            if (_predictionMessage != null) // Display _predictionMessage if not null
              NotificationElement(
                image1: "assets/icons/icon2.png",
                text: _predictionMessage!,
                clock: "02:20 pm",
              ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1.0,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Last 7 Days ",
                  style: TextStyle(
                    fontSize: 24,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            NotificationElement(
              image1: "assets/icons/icon.png",
              text: " The gas percentage reached 30 %.",
              clock: "02:20 pm",
            ),
            const SizedBox(
              height: 20,
            ),
            NotificationElement(
              image1: "assets/icons/icon2.png",
              text: " The gas percentage reached 100 %.",
              clock: "02:20 pm",
            ),
            const SizedBox(
              height: 20,
            ),
            NotificationElement(
              image1: "assets/icons/Vector3.png",
              text: "  The device's usage period has almost expired.",
              clock: "02:20 pm",
            ),
            const SizedBox(
              height: 20,
            ),
            NotificationElement(
              image1: "assets/icons/Group5.png",
              text: "You have new messages, go to chat.",
              clock: "02:20 pm",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationElement extends StatelessWidget {
  NotificationElement({
    required this.image1,
    required this.text,
    required this.clock,
  });

  final String text;
  final String image1;
  final String clock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 12),
      child: Container(
        height: 40,
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(image1),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: const TextStyle(color:PrimaryColor, fontSize: 16),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                clock,
                style: const TextStyle(
                  fontSize: 8,
                  fontFamily: 'Poppins',
                color:  SecondColor,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
