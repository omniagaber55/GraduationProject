import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class LogInAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                  color: PrimaryColor),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      actions: [
        Container(
          height: 46,
          width: 93,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text('Yes',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          height: 46,
          width: 93,
          decoration: BoxDecoration(
            color: PrimaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
