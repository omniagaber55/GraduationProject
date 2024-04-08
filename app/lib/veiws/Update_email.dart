import 'package:app/Components/custom_button.dart';
import 'package:app/Components/custom_email.dart';
import 'package:app/Components/custom_password.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class Update_email extends StatefulWidget {
  @override
  State<Update_email> createState() => _Update_emailState();
}

class _Update_emailState extends State<Update_email> {
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: PrimaryColor,
                        size: 26,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "Update Your Email",
              style: TextStyle(
                  color: PrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icons/fluent_note-pin-20-filled.png"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Note",
                        style: TextStyle(
                            color: PrimaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "When you update your email,\nwe will send new OTP on your new \nemail to verify it ",
                    style: TextStyle(
                        color: PrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Custom_email(email: "Enter your current Email"),
            SizedBox(
              height: 36,
            ),
            Custom_password(password: "Enter your current Password"),
            SizedBox(
              height: 36,
            ),
            Custom_email(email: "Enter your new Email"),
            SizedBox(
              height: 25,
            ),
            customButton(ontap: () {}, text: "Send OTP")
          ],
        ),
      )),
    );
  }
}
