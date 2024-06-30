import 'dart:convert';

import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/CustomPassword.dart';
import 'package:app/Components/validator.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Createpassword extends StatefulWidget {
  const Createpassword({super.key});

  @override
  State<Createpassword> createState() => _CreatepasswordState();
}

class _CreatepasswordState extends State<Createpassword> {
  final String apiUrl =
      'https://jsonplaceholder.typicode.com/posts'; // API endpoint for posting password reset data

  final TextEditingController confirmpasswordController =
      TextEditingController(); // Controller for confirm password field
  final TextEditingController passwordController =
      TextEditingController(); // Controller for password field
  String result = ''; // Variable to store API call result

  // Function to send password reset data to the server
  Future<void> _postData() async {
    String password =
        passwordController.text; // Get password from password field
    String confirmedPassword = confirmpasswordController
        .text; // Get confirmed password from confirm password field

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'password': password,
          'password_confirmation':
              confirmedPassword, // Send confirmed password in the body
        }),
      );

      if (response.statusCode == 201) {
        setState(() {
          result = 'Data added successfully!'; // result message on success
          print('Password: $password'); // Print entered password
          print(
              'Confirmed Password: $confirmedPassword'); // Print confirmed password
        });
      } else {
        setState(() {
          result =
              'API call failed. Status code: ${response.statusCode}'; // Update result message on API failure
        });
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e'; // Handle and display error message
      });
    }
  }

  bool eye = true; // Variable to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Navigate back when back button is pressed
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: PrimaryColor,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Create Password",
                style: TextStyle(
                  color: PrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 11),
              const Text(
                "Create Your Unique Password",
                style: TextStyle(
                  color: PrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 40),
              CustomPasswordField(
                controller: passwordController,
                labelText: "Enter Your Password",
              ),
              const SizedBox(height: 32),
              CustomPasswordField(
                controller: confirmpasswordController,
                labelText: "Confirm Your Password",
              ),
              const SizedBox(height: 20),
              // Validators for password strength
              const Validator(validate: "At least 6 characters"),
              const Validator(validate: "At least one lower case letter"),
              const Validator(validate: "At least one upper case letter"),
              const Validator(validate: "Can contain special signs"),
              const SizedBox(height: 60),
              CustomButton(
                onTap: _postData,
                label: "Save",
              ),
              Text(result), // Display API call result
            ],
          ),
        ),
      ),
    );
  }
}
