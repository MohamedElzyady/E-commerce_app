import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/pages/car.dart';
import 'package:e_commerce_app/pages/favorits.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/profile.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({super.key});

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  List screens = [Scaffold(), Favorits(), Home(), Cart(), Profile3()];
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: CircleBorder(),
        backgroundColor: kprimaryColor,
        child: Icon(Icons.home, color: Colors.white, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.grid_view_outlined,
                color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite_border,
                color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
                size: 30,
              ),
            ),
            Gap(10),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person,
                color: currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
