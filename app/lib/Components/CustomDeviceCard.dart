import 'package:app/constants.dart';
import 'package:app/models/Device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class CustomDeviceCard extends StatelessWidget {
  CustomDeviceCard({
    required this.product,
    required this.index,
    Key? key, required bool isPrimaryColor,
  }) : super(key: key);

  final DeviceModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap on the card
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xff009589)),
           color: index == 3 || index == 4 ? PrimaryColor : White,
            
        ),
        child: Center(
          child: Text(
            product.name,
            style: TextStyle(
               color: index == 3 || index == 4 ? Colors.white : PrimaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
