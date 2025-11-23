import 'package:flutter/material.dart';

class SliderImageDetails extends StatelessWidget {
  final Function(int) oneChange;
  final String image;
  const SliderImageDetails({
    super.key,
    required this.oneChange,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: oneChange,
        itemBuilder: (context, index) {
          return Hero(tag: image, child: Image.asset(image));
        },
      ),
    );
  }
}
