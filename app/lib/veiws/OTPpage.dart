// Import necessary packages and files

import 'package:app/Components/CustomButtom.dart';
import 'package:app/Components/OTPform.dart';

import 'package:app/constants.dart';
import 'package:app/veiws/Home.dart';
import 'package:flutter/material.dart';

class Otp_page extends StatefulWidget {
  const Otp_page({super.key});

  @override
  State<Otp_page> createState() => _Otp_pageState();
}

class _Otp_pageState extends State<Otp_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/otp.png'),
              width: 243,
              height: 211,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Column(
                children: [
                  Text(
                    "OTP Verification Code",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: PrimaryColor),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Enter Verification Code Sent To Your \nEmail Address",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: PrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const OTP(), // Custom OTP widget, assuming it's implemented in OTPform.dart
            const SizedBox(height: 40),
            CustomButton(
              onTap: () {
                // Handle tap event for the Verify button
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              label: "Verify",
            )
          ],
        ),
      ),
    );
  }
}
