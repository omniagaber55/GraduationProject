import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart'; // add this import

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final pinController = TextEditingController();


  
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(
          fontSize: 32, color: PrimaryColor, fontWeight: FontWeight.w400),
      decoration: BoxDecoration(
        border: Border.all(color: PrimaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: PrimaryColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey, // add this
        child: Pinput(
          length: 5,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          validator: (s) {
            if (s == '22222') return null;
            return 'Pin is incorrect';
          },
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onCompleted: (pin) async {
            if (formKey.currentState!.validate()) {
              // PIN is correct, do something
              print(pin);
            } else {
              // PIN is incorrect, show alert dialog
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                 
                  content: Text('OTP is not correct try again'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}