import 'package:app/Components/custom_button.dart';
import 'package:app/Components/custom_password.dart';
import 'package:app/Components/validator.dart';
import 'package:app/constants.dart';

import 'package:flutter/material.dart';

class Reset_Password extends StatefulWidget {
  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  bool eye = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
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
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Reset Your Password",
              style: TextStyle(
                  color: PrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 11,
            ),
            const Text(
              "Create Your Unique Password",
              style: TextStyle(
                  color: PrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 40,
            ),
            Custom_password(password: "Enter New Password"),
            SizedBox(
              height: 32,
            ),
            Custom_password(password: "Confirm New Password"),
            SizedBox(
              height: 20,
            ),
            validator(validate: "At least 6 characters"),
            validator(validate: "At least one lower case letter "),
            validator(validate: "At least one upper case letter "),
            validator(validate: "Can contain special signs "),
            const SizedBox(
              height: 60,
            ),
            customButton(ontap: () {}, text: "UPDATE PASSWORD")
          ],
        ),
      )),
    );
  }
}
