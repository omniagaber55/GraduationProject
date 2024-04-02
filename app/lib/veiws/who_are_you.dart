import 'package:app/Components/custom_button.dart';
import 'package:app/Components/custom_password.dart';
import 'package:app/constants.dart';
import 'package:app/veiws/SignUpAsBuyer.dart';
import 'package:app/veiws/onboarding_screen.dart';
import 'package:app/veiws/splashForBuyer.dart';
import 'package:flutter/material.dart';

class WhoAreYou extends StatefulWidget {
  const WhoAreYou({super.key});

  @override
  State<WhoAreYou> createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Image.asset(
                  "assets/images/Group 435.png",
                  width: 250,
                  height: 245,
                ),
                const SizedBox(
                  height: 32,
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text(
                  "If you want to use the device, ",
                  style: TextStyle(
                      fontSize: 16,
                      color: PrimaryColor,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Click here",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: PrimaryColor),
                ),
                ],
               ),
                const SizedBox(
                  height: 8,
                ),
                customButton( ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>OnboardingPage(),
                        ),
                      );
                    }, text: "User"),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "If you want to buy and sell fertilizer,",
                      style: TextStyle(
                          fontSize: 16,
                          color: PrimaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      " Click here",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: PrimaryColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                customButton(
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp_Buyer(),
                        ),
                      );
                    },
                    text: "Buyer"),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
