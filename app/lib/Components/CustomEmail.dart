import 'package:app/constants.dart';
import 'package:app/services/PostLogIn.dart';

import 'package:flutter/material.dart';

class CustomEmail extends StatefulWidget {
  const CustomEmail({
    super.key,
    required this.label,
    this.hintText,
    this.color1,
    required this.onChanged, required this.controller,
  });
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final Color? color1;
  final  onChanged;
  @override
  _CustomEmailState createState() => _CustomEmailState();
}

class _CustomEmailState extends State<CustomEmail> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
 final ApiService _apiService = ApiService();
  String _email = '';
  String _password = '';

  void _login() async {
    try {
      final user = await _apiService.login(_email, _password);
      print('Logged in as ${user.name}');
      
    } catch (e) {
      print('Failed to login: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: SizedBox(
        height: 59,
        width: 346,
        child: TextFormField(
           onChanged:(value) => _email,
          keyboardType: TextInputType.emailAddress,
          
          maxLines: 2,
          cursorColor: PrimaryColor,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: widget.color1),
           
          labelText: widget.label,
            labelStyle: const TextStyle(
              fontSize: 16,
              color: PrimaryColor,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(color: PrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}