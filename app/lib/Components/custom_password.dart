import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_password extends StatefulWidget {
  Custom_password({super.key, required this.password});
  String password;

  @override
  State<Custom_password> createState() => _Custom_passwordState();
}

class _Custom_passwordState extends State<Custom_password> {
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        height: 59,
        width: 346,
        child: TextFormField(
          obscureText: eye,
          decoration: InputDecoration(
            labelText: widget.password,
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
    );
  }
}
