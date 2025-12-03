import 'package:e_commerce_app/features/models/product_model.dart';
import 'package:e_commerce_app/features/home/widgets/product_cart.dart';
import 'package:e_commerce_app/features/home/widgets/categroy.dart';
import 'package:e_commerce_app/shared/custom_app_bar.dart';
import 'package:e_commerce_app/features/home/widgets/custom_search.dart';
import 'package:e_commerce_app/features/home/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(40),
              CustomAppBar(),
              Gap(20),
              CustomSearch(),
              Gap(20),

              ImageSlider(
                currentSlider: currentSlider,
                oneChange: (v) {
                  setState(() {
                    currentSlider = v;
                  });
                },
              ),
              Gap(20),
              Categroy(),
              Gap(10),
              
              Row(
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Spacer(),
                  Text("See all", style: TextStyle(color: Colors.grey)),
                ],
              ),
              Gap(10),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: ProductModel.products.length,
                itemBuilder: (context, index) {
                  final product = ProductModel.products[index];
                  return ProductCart(product: product);
                },
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
