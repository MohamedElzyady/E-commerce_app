import 'package:e_commerce_app/features/core/colors.dart';
import 'package:e_commerce_app/features/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Apply",
                  style: TextStyle(
                    color: kprimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              hintText: 'Enter Discount Code',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Gap(20),
          Row(
            children: [
              Text(
                "Suptotal",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                "\$${provider.totalPrice()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          ),
          Gap(10),
          Divider(),
          Row(
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                "\$${provider.totalPrice()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          ),
          Gap(20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 17, horizontal: 130),
            decoration: BoxDecoration(
              color: kprimaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "CheckOut",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17
              ),
            ),
          ),
        ],
      ),
    );
  }
}
