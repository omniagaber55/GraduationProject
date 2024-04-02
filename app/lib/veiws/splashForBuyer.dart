import 'package:app/Components/custom_button.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class Buyer_Splash extends StatelessWidget {
  const Buyer_Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:SafeArea(child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            Image.asset("assets/images/Group 438.png")
         ,SizedBox(
          height: 60,
         ),
         Text("Now, you can find and buy \nfertilizers in an easy way",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,color: PrimaryColor,wordSpacing: .1),textAlign: TextAlign.center,)
        ,SizedBox(
          height: 45,
        ),
        customButton(ontap: (){
          
        }, text: "Start"),
        SizedBox(
          height: 90,
        ),
          ],
        ),
      ))),
    );
  }
}