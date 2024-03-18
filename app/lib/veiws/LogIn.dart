import 'package:app/constants.dart';

import 'package:flutter/cupertino.dart';
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 24,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              const Text(
                "Log in to control your another device",
                style: TextStyle(
                    fontSize: 16,
                    color: PrimaryColor,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 8,
              ),
              Image.asset(
                "assets/images/Group 138 (1).png",
                width: 129,
                height: 142,
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        height: 59,
       width: 346 ,
        child: const TextField(
          decoration: InputDecoration(
            label: Text(
              "Enter Your Email",
              style: TextStyle(fontSize: 16, color: PrimaryColor,fontWeight: FontWeight.w400),
            ),
            focusedBorder:
                OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(color: PrimaryColor)),
            enabledBorder:
               
                OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(color: PrimaryColor)),
            border: OutlineInputBorder(
 borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide( color:PrimaryColor)),
          ),
        ),
      ),
    ),
            
              SizedBox(
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
              labelStyle: TextStyle(
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: PrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: PrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: PrimaryColor),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
         
          ),
        ),
      ),
    ),

              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Did You Forget Your Password?",
                    style: TextStyle(
                        fontSize: 14,
                        color: PrimaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      " Forget",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: PrimaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(
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
          child: Center(
              child: Text(
             "Login",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400),
          )),
        ),
      ),
    ),
            
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Is This Your First Time Using The Device?",
                    style: TextStyle(
                        fontSize: 14,
                        color: PrimaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
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
    );
  }
}
