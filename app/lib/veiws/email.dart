import 'package:app/Components/CustomButtom.dart';
import 'package:app/constants.dart';
import 'package:app/veiws/OTPpage.dart';
import 'package:flutter/material.dart';

class EmailVerication extends StatelessWidget {
  EmailVerication({super.key});
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
         
              SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/otp.png'),
                      width: 243,
                      height: 211,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Enter Verification Email",
                      style: TextStyle(
                        color: PrimaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please ensure you carefully review the \nprovided email as it is the only way to control \nthe device.",
                      style: TextStyle(
                        color: PrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  height: 59,
                  width: 346,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    cursorColor: PrimaryColor,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: PrimaryColor),
                      labelText: "Email",
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
              const SizedBox(height: 40),
              CustomButton(onTap: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Otp_page(),
                      ),
                    );
              }, label: "Send OTP")
            ],
          ),
        ),
      ),
    );
  }
}
