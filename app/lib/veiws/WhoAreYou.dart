import 'package:app/Components/CustomButtom.dart';
import 'package:app/veiws/SignUpAsBuyer.dart';
import 'package:app/veiws/onboardingScreen.dart';
import 'package:flutter/material.dart';

import 'package:app/constants.dart';

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
                  height: 140,
                ),
                Image.asset(
                  "assets/images/Group 435.png",
                  width: 250,
                  height: 245,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "If you want to use the device", // Description for User option
                    style: TextStyle(
                        fontSize: 16,
                        color: PrimaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const OnboardingPage(), // Navigate to OnboardingPage for User
                      ),
                    );
                  },
                  label: "User",
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    "If you want to buy fertilizer", // Description for Buyer option
                    style: TextStyle(
                        fontSize: 16,
                        color: PrimaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignUp_Buyer(), // Navigate to SignUpAsBuyer for Buyer
                      ),
                    );
                  },
                  label: "Buyer",
                ),
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
