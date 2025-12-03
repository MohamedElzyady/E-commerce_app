import 'package:e_commerce_app/features/models/categroy_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Categroy extends StatelessWidget {
  const Categroy({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = CategroyModel.items[index];
          return Column(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(10),
              Text(
                item.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemCount: CategroyModel.items.length,
      ),
    );
  }
}
