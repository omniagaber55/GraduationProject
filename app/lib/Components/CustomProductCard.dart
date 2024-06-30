import 'package:app/constants.dart';
import 'package:app/models/market.dart';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            Container(
              width:170,
              height: 240,
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: White,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                   const SizedBox(height: 5),
                  Text(
                    product.location,
                    style: const TextStyle(
                      color: White,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              
               
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only( top: 80),
              width: 170,
              height: 208,
              decoration: BoxDecoration(
                color: White,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Text(
                    'Amount:${product.amount.toString()}KG',
                    style: const TextStyle(
                      color: PrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Price:${product.price.toString()}LE',
                    style: const TextStyle(
                      color: PrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}