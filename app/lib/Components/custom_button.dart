import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  customButton({super.key, required this.ontap, required this.text});
  VoidCallback ontap;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 55,
          width: 348,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: PrimaryColor,
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400),
          )),
        ),
      ),
    );
  }
}
