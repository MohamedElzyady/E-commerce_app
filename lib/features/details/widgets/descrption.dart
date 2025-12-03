import 'package:e_commerce_app/features/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Descrption extends StatelessWidget {
  final String text;
  const Descrption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 11),
              decoration: BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Description",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Specifications",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Reviews",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Gap(20),
        Text(text, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
