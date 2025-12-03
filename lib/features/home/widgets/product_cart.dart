import 'package:e_commerce_app/features/core/colors.dart';
import 'package:e_commerce_app/features/models/product_model.dart';
import 'package:e_commerce_app/features/details/details.dart';
import 'package:e_commerce_app/features/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductCart extends StatefulWidget {
  final ProductModel product;
  const ProductCart({super.key, required this.product});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(product: widget.product),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kcontentColor,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(15),
                Center(
                  child: Hero(
                    tag: widget.product.image,
                    child: Image.asset(
                      widget.product.image,
                      width: 130,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.product.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      " \$ ${widget.product.price}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: List.generate(widget.product.colors.length, (
                        index,
                      ) {
                        return Container(
                          width: 18,
                          height: 18,
                          margin: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                            color: widget.product.colors[index],
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: AlignmentGeometry.topRight,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    provider.toggleFavorit(widget.product);
                  },
                  child: Icon(
                    provider.isExist(widget.product)
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
