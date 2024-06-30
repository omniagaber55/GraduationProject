// Name and address
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class CustomFiled extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const CustomFiled({super.key, 
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: SizedBox(
        height: 59,
        width: 346,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          maxLines: 2,
          cursorColor: PrimaryColor, // Change cursor color as needed
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: PrimaryColor), // Change hint color as needed
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 16,
              color: PrimaryColor, // Change label color as needed
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor), // Change border color as needed
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor), // Change border color as needed
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor), // Change border color as needed
            ),
          ),
        ),
      ),
    );
  }
}

