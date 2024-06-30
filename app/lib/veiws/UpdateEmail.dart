import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/CustomEmail.dart';
import 'package:app/Components/CustomPassword.dart';
import 'package:app/constants.dart';

class EmailUpdateScreen extends StatefulWidget {
  const EmailUpdateScreen({super.key});

  @override
  State<EmailUpdateScreen> createState() => _EmailUpdateScreenState();
}

class _EmailUpdateScreenState extends State<EmailUpdateScreen> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  final TextEditingController newEmailController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String result = '';

  // Function to make POST request to update email
  Future<void> _postData() async {
    String email = emailController.text;
    String password = passwordController.text;
    String newEmail = newEmailController.text;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
          'new_email': newEmail,
        }),
      );

      if (response.statusCode == 201) {
        // Update UI if data was successfully added
        setState(() {
          result = 'Data added successfully!'; // Update result message
          print('Email: $email'); // Print email for debugging
          print('Password: $password'); // Print password for debugging
          print('New Email: $newEmail'); // Print new email for debugging
        });
      } else {
        // Handle API call failure
        setState(() {
          result = 'API call failed. Status code: ${response.statusCode}';
        });
      }
    } catch (e) {
      // Handle any errors that occur during the POST request
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                // Back button to navigate to previous screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: PrimaryColor,
                        size: 26,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Update Your Email",
                  style: TextStyle(
                    color: PrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40),
                // Note section with instructions for updating email
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                              "assets/icons/fluent_note-pin-20-filled.png"),
                          const SizedBox(width: 5),
                          const Text(
                            "Note",
                            style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "When you update your email,\nwe will send new OTP on your new \nemail to verify it",
                        style: TextStyle(
                          color: PrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
                // Text field for entering current email
                CustomEmail(
                  label: "Enter Your Email",
                  onChanged: null,
                  controller: emailController,
                ),
                const SizedBox(height: 20.0),
                // Text field for entering password
                CustomPasswordField(
                  controller: passwordController,
                  labelText: "Enter Your Password",
                ),
                const SizedBox(height: 20.0),
                // Text field for entering new email
                CustomEmail(
                  label: "New Email",
                  onChanged: null,
                  controller: newEmailController,
                ),
                const SizedBox(height: 30),
                // Button to initiate OTP sending process
                CustomButton(onTap: _postData, label: "Send OTP"),
                // Display result message from API call
                Text(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
