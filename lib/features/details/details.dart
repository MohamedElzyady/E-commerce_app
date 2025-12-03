import 'package:e_commerce_app/features/core/colors.dart';
import 'package:e_commerce_app/features/models/product_model.dart';
import 'package:e_commerce_app/features/details/widgets/items_details.dart';
import 'package:e_commerce_app/features/details/widgets/addTo_card.dart';
import 'package:e_commerce_app/features/details/widgets/descrption.dart';
import 'package:e_commerce_app/features/details/widgets/details_app_bar.dart';
import 'package:e_commerce_app/shared/slider_image_details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Details extends StatefulWidget {
  final ProductModel product;
  const Details({super.key, required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int currentIamge = 0;
  int currentColor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      floatingActionButton: AddtoCard(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailsAppBar(
                product: widget.product,
              ),
              SliderImageDetails(
                oneChange: (v) {
                  setState(() {
                    currentIamge = v;
                  });
                },
                image: widget.product.image,
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: currentIamge == index ? 15 : 8,
                    height: 8,
                    margin: EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIamge == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(color: Colors.black),
                    ),
                  );
                }),
              ),
              Gap(10),
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemsDetails(product: widget.product),
                    Gap(20),
                    Text(
                      "Color",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Gap(20),
                    Row(
                      children: List.generate(widget.product.colors.length, (
                        index,
                      ) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            padding: currentColor == index
                                ? EdgeInsets.all(2)
                                : null,
                            margin: EdgeInsets.only(right: 10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentColor == index
                                  ? Colors.white
                                  : widget.product.colors[index],
                              border: currentColor == index
                                  ? Border.all(
                                      color: widget.product.colors[index],
                                    )
                                  : null,
                            ),
                            duration: Duration(milliseconds: 300),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.product.colors[index],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Gap(20),
                    Descrption(text: widget.product.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
