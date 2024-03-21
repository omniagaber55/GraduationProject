import 'package:app/Components/custom_button.dart';
import 'package:app/Components/custom_email.dart';
import 'package:app/Components/custom_password.dart';
import 'package:app/constants.dart';

import 'package:flutter/material.dart';

class LogIn_Screen extends StatefulWidget {
  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 24,
                      color: PrimaryColor,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Log in to control your another device",
                  style: TextStyle(
                      fontSize: 16,
                      color: PrimaryColor,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 8,
                ),
                Image.asset(
                  "assets/images/Group 138 (1).png",
                  width: 129,
                  height: 142,
                ),
                const SizedBox(
                  height: 32,
                ),
                Custom_email(email: "Enter Your Email"),
                const SizedBox(
                  height: 32,
                ),
                Custom_password(password: "Enter Your Password"),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Did You Forget Your Password?",
                      style: TextStyle(
                          fontSize: 14,
                          color: PrimaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        " Forget",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: PrimaryColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                customButton(ontap: () {}, text: "Login"),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Is This Your First Time Using The Device?",
                      style: TextStyle(
                          fontSize: 14,
                          color: PrimaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        " SignUp",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: PrimaryColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
