import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class Custom_email extends StatelessWidget {
  Custom_email({super.key, required this.email});
  String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        height: 59,
        width: 346,
        child: TextFormField(
          decoration: InputDecoration(
            label: Text(
              email,
              style: const TextStyle(
                  fontSize: 16,
                  color: PrimaryColor,
                  fontWeight: FontWeight.w400),
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: PrimaryColor)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: PrimaryColor)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: PrimaryColor)),
          ),
        ),
      ),
    );
  }
}
