import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemsDetails extends StatelessWidget {
  final ProductModel product;
  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        Gap(10),
        Text(
          "\$${product.price}",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        Gap(10),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: 50,
              height: 23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kprimaryColor,
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Icon(Icons.star, size: 15, color: Colors.white),
                  Gap(3),
                  Text(
                    product.rate.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Gap(5),
            Text(
              product.review,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Seller: ", style: TextStyle(fontSize: 16)),
                  TextSpan(
                    text: product.seller,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
