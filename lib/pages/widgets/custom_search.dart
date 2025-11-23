import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kcontentColor,
      ),

      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey, size: 25),
          Gap(10),
          Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: "search...",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(width: 1.5, height: 25, color: Colors.grey),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.tune, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
