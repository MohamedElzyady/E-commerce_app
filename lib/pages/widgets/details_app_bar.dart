import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsAppBar extends StatefulWidget {
  final ProductModel product;
  const DetailsAppBar({super.key, required this.product});

  @override
  State<DetailsAppBar> createState() => _DetailsAppBarState();
}

class _DetailsAppBarState extends State<DetailsAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: Icon(Icons.share_outlined),
          ),
          Gap(10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              provider.toggleFavorit(widget.product);
            },
            icon: Icon(
              provider.isExist(widget.product)
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
