import 'package:app/Components/Alert_dialog.dart';
import 'package:app/Components/profile_item.dart';
import 'package:app/constants.dart';
import 'package:app/veiws/ResetYourPassword.dart';
import 'package:app/veiws/Update_email.dart';
import 'package:app/veiws/switchDevice.dart';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset("assets/icons/Group 127.png"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "rshawky@mail.com",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Update_email(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.only(left: 28, right: 60),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Column(
              children: [
                Column(
                  children: [
                    Profile_item(
                        tap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Reset_Password(),
                            ),
                          );
                        },
                        text: "Reset Password",
                        image1: "assets/icons/arcticons_passwordgenerator.png"),
                    Profile_item(
                        tap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SwitchDevice(),
                            ),
                          );
                        },
                        text: "Switch Device  ",
                        image1: "assets/icons/Vector.png"),
                    Profile_item(
                        tap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SwitchDevice(),
                            ),
                          );
                        },
                        text: "Help                ",
                        image1: "assets/icons/clarity_help-info-solid.png"),
                    Profile_item(
                        tap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return LogInAlertDialog();
                            },
                          );
                        },
                        text: "Log Out          ",
                        image1: "assets/icons/solar_logout-3-linear.png"),
                    SizedBox(
                      height: 65,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
