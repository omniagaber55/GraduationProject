import 'package:app/constants.dart';
import 'package:app/models/Device.dart';
import 'package:flutter/material.dart';

class CustomDeviceCard extends StatelessWidget {
  final DeviceModel product;
  final int index;
  final bool isPrimaryColor;

  const CustomDeviceCard({
    required this.product,
    required this.index,
    required this.isPrimaryColor,
    Key? key,
  }) : super(key: key);

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
          color: isPrimaryColor ? PrimaryColor : Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name, // Use the appropriate property of DeviceModel
                  style: TextStyle(
                    color: isPrimaryColor ? Colors.white : PrimaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Location: ${product.location}', // Example of using another property
                  style: TextStyle(
                    color: isPrimaryColor ? Colors.white : PrimaryColor,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Price: ${product.price}', // Example of using another property
                  style: TextStyle(
                    color: isPrimaryColor ? Colors.white : PrimaryColor,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Amount: ${product.amount}', // Example of using another property
                  style: TextStyle(
                    color: isPrimaryColor ? Colors.white : PrimaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
