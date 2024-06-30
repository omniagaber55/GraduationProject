import 'package:app/Components/CustomButtom.dart';
import 'package:app/veiws/MarketForBuyer.dart';
import 'package:flutter/material.dart';

import 'package:app/constants.dart'; 

class BuyerSplash extends StatelessWidget {
  const BuyerSplash({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            Image.asset("assets/images/Group 438.png"),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Now, You Can Buy Fertilizers \nIn An Easy Way",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: PrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 45,
            ),
            // Button to navigate to MarketForBuyer screen
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  MarketForBuyer(),
                  ),
                );
              },
              label: "Start",
            ),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
