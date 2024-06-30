import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/constants.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomPasswordField> {
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: SizedBox(
        height: 59,
        width: 346,
        child: TextFormField(
          controller: widget.controller,
          maxLines: 1,
          cursorColor: PrimaryColor,
          obscureText: eye,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(
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
