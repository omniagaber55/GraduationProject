import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Controlling_device extends StatefulWidget {
  @override
  State<Controlling_device> createState() => _Controlling_deviceState();
}

class _Controlling_deviceState extends State<Controlling_device> {
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
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
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
                const Text(
                  "Control another device",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    height: 59,
                    width: 346,
                    child: const TextField(
                      decoration: InputDecoration(
                        label: Text(
                          "Enter Your Email",
                          style: TextStyle(
                              fontSize: 16,
                              color: PrimaryColor,
                              fontWeight: FontWeight.w400),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: PrimaryColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: PrimaryColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: PrimaryColor)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    height: 59,
                    width: 346,
                    child: Form(
                      child: TextFormField(
                        obscureText: eye,
                        decoration: InputDecoration(
                          labelText: "Enter Your Password",
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: PrimaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                eye = !eye;
                              });
                            },
                            icon: eye
                                ? const Icon(
                                    CupertinoIcons.eye_slash_fill,
                                    color: PrimaryColor,
                                  )
                                : const Icon(
                                    CupertinoIcons.eye_fill,
                                    color: PrimaryColor,
                                  ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: PrimaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: PrimaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: PrimaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 55,
                      width: 348,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: PrimaryColor,
                      ),
                      child: const Center(
                          child: Text(
                        "Switch",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      )),
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
