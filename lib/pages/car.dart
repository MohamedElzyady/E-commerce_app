import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/pages/buttom_bar.dart';
import 'package:e_commerce_app/pages/widgets/check_out.dart';
import 'package:e_commerce_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  @override
  State<Cart> createState() => _CartState();
}
class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    productQuantiry(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQtn(index)
                : provider.decremenQtn(index);
          });
        },
        child: Icon(icon, size: 20),
      );
    }
    return Scaffold(
      bottomSheet: CheckOut(),
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: kcontentColor,
                      padding: EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ButtomBar()),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "My Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Container(),
                ],
              ),
            ),
            provider.cart.isEmpty
                ? Center(
                    child: Text(
                      "No products",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: provider.cart.length,
                      itemBuilder: (context, index) {
                        final cuurentCart = provider.cart[index];
                        return Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.all(15),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsetsGeometry.all(10),
                                      width: 100,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(cuurentCart.image),
                                    ),
                                    Gap(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cuurentCart.title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Gap(5),
                                        Text(
                                          cuurentCart.category,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        Gap(10),
                                        Text(
                                          "\$${cuurentCart.price}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 35,
                              top: 35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      provider.cart.removeAt(index);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Gap(10),
                                  Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: kcontentColor,
                                      border: Border.all(
                                        color: Colors.grey.shade200,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        productQuantiry(Icons.add, index),
                                        Text(
                                          cuurentCart.quantity.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        productQuantiry(Icons.remove, index),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
