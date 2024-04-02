import 'package:app/Components/custom_button.dart';
import 'package:app/Components/custom_email.dart';
import 'package:app/Components/custom_password.dart';
import 'package:app/constants.dart';
import 'package:app/veiws/splashForBuyer.dart';
import 'package:flutter/material.dart';

class SignUp_Buyer extends StatelessWidget {


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
              padding: const EdgeInsets.only(left: 12),
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
           
            Text(
              "Sign Up as Buyer",
              style: TextStyle(
                  color: PrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                     
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Enter your data to enjoy using our store",
                        style: TextStyle(
                            color: PrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                
                
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Custom_email(email: "Enter your Name"),
            SizedBox(
              height: 36,
            ),
            Custom_email(email: "Enter your Address"),
            SizedBox(
              height: 36,
            ),
              Custom_email(email: "Enter your new Email"),
            SizedBox(
              height: 36,
            ),
            Custom_password(password: "Enter your Password"),
       
            SizedBox(
              height: 36,
            ),
            customButton(ontap: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Buyer_Splash(),
                        ),
                      );
            }, text: "Sign Up")
          ],
        ),
      )),
    );
  }
}
