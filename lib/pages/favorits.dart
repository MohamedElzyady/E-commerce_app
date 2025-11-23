import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Favorits extends StatefulWidget {
  const Favorits({super.key});

  @override
  State<Favorits> createState() => _FavoritsState();
}

class _FavoritsState extends State<Favorits> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        title: Text("Favorite", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          provider.favorits.isEmpty
              ? Center(
                  child: Text(
                    "No favorite",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: provider.favorits.length,
                    itemBuilder: (context, index) {
                      final cuurentCart = provider.favorits[index];
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
                                    width: 85,
                                    height: 85,
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
                                    provider.favorits.removeAt(index);
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                ),
                                Gap(10),
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
    );
  }
}
