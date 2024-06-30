import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  VoidCallback? onTap;
  String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: InkWell(
          onTap: onTap,
          child: Container(
              height: 55,
              width: 348,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: PrimaryColor,
              ),
              child: Center(
                  child: Text(
                label,
                style: const TextStyle(
                    fontSize: 24, color: White, fontWeight: FontWeight.w400),
              )))),
    );
  }
}
