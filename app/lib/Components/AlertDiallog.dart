import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class LogoutAlertDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutAlertDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: PrimaryColor),
      ),
      content: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Do you want to Log Out?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: PrimaryColor,
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 42,
            width: 93,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextButton(
              onPressed: onConfirm, // Call onConfirm callback on "Yes" press
              child: const Text(
                'Yes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 42,
            width: 93,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog on "No" press
              },
              child: const Text(
                'No',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
