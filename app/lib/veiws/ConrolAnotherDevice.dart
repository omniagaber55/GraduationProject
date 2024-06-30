import 'package:app/Components/BottomNavBar.dart';
import 'package:app/Components/CustomEmail.dart';
import 'package:app/Components/CustomPassword.dart';
import 'package:app/constants.dart';

import 'package:flutter/material.dart';

class Controlling_device extends StatefulWidget {
  const Controlling_device({super.key});

  @override
  State<Controlling_device> createState() => _Controlling_deviceState();
}

class _Controlling_deviceState extends State<Controlling_device> {
  bool eye = true; // State variable for password visibility
  final TextEditingController emailController =
      TextEditingController(); // Controller for email input field
  final TextEditingController passwordController =
      TextEditingController(); // Controller for password input field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Navigate back on back arrow click
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
                const Text(
                  "Control another device", // Title text
                  style: TextStyle(
                    fontSize: 24,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Log in to control your another device", // Subtitle text
                  style: TextStyle(
                    fontSize: 16,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Image.asset(
                  "assets/images/Group 138 (1).png", // Image asset
                  width: 129,
                  height: 142,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomEmail(
                  label: "Enter Your Email", // Email input field
                  onChanged: null,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomPasswordField(
                  controller: passwordController, // Password input field
                  labelText: "Enter Your Password",
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBar(),
                        ),
                      );
                    },
                    child: Container(
                      height: 55,
                      width: 348,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: PrimaryColor,
                      ),
                      child: const Center(
                        child: Text(
                          "Switch", // Button text
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
