import 'package:e_commerce_app/features/core/colors.dart';
import 'package:e_commerce_app/features/models/product_model.dart';
import 'package:e_commerce_app/features/provider/cart_provider.dart';
import 'package:flutter/material.dart';


class AddtoCard extends StatefulWidget {
  final ProductModel product;
  const AddtoCard({super.key, required this.product});

  @override
  State<AddtoCard> createState() => _AddtoCardState();
}

class _AddtoCardState extends State<AddtoCard> {
  int hamo = 1;

  @override
  Widget build(BuildContext context) {
    final Provider = CartProvider.of(context);
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (hamo != 1) {
                          hamo--;
                        } else {
                          hamo = 1;
                        }
                      });
                    },
                    icon: Icon(Icons.remove, color: Colors.white),
                  ),
                  Text(
                    hamo.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        hamo++;
                      });
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Provider.toggleFavorit(widget.product);
                const snackBar = SnackBar(
                  content: Text(
                    "succesful adedd",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
