import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class PersonChat extends StatelessWidget {
  PersonChat({Key? key, required this.name, required this.image}) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: PrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(.5), // stroke
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white,
            child: Image(
              image: AssetImage(image),
            ),
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: PrimaryColor,
          ),
        ),
      ),
      
    );
  }
}
