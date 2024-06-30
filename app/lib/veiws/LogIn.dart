
import 'package:app/Components/CustomButtom.dart';
import 'package:app/constants.dart';
import 'package:app/services/PostLogIn.dart';
import 'package:app/veiws/Permission.dart';
import 'package:app/veiws/ScanQR_Code.dart';
import 'package:app/veiws/email.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class LogIn_Screen extends StatefulWidget {
  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {

  bool eye = true;
   final ApiService _apiService = ApiService();
  String _email = '';
  String _password = '';

  void _login() async {
    try {
      final user = await _apiService.login(_email, _password);
      print('Logged in as ${user.name}');
      Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Permission(),
                ),
              );

    } catch (e) {
      print('Failed to login: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
          
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Login",
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
        child: TextFormField(
           onChanged: (value) => _email = value,
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          cursorColor: PrimaryColor,
          decoration: const InputDecoration(
            labelText:"Enter Your Email",
            labelStyle: TextStyle(
              fontSize: 16,
              color: PrimaryColor,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor),
            ),
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
        child: TextFormField(
         onChanged: (value) => _password = value,
          maxLines: 1,
          cursorColor: PrimaryColor,
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
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Row(
                                                             
                                  children: [
                                              const Text(
                                                "Did You Forget Your Password?",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: PrimaryColor,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmailVerication(),
                ),
              );
                                                },
                                                child: const Text(
                                                  " Reset password",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w700,
                                                      color: PrimaryColor),
                                                ),
                                              )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            CustomButton(onTap: _login, label: "Login"),
                               SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                              const Text(
                                                "Is This Your First Time Using The Device?",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: PrimaryColor,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                    Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanQRCode(),
                ),
              );
                                                },
                                                child: const Text(
                                                  " SignUp",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w700,
                                                      color: PrimaryColor),
                                                ),
                                              )
                                  ],
                                ),
                              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}