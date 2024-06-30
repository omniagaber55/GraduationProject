import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class Profile_item extends StatelessWidget {
  Profile_item({super.key, required this.text, required this.image1, this.tap});
  String text;
  String image1;
  VoidCallback? tap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: InkWell(
        onTap: tap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image1,
              height: 32,
              width: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                text,
                style: const TextStyle(
                    color: PrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Image.asset("assets/icons/Vector (1).png"),
            ),
          ],
        ),
      ),
    );
  }
}