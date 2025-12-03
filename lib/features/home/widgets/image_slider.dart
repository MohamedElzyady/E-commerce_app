import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function(int) oneChange;
  final int currentSlider;
  const ImageSlider({
    super.key,
    required this.oneChange,
    required this.currentSlider,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              physics: ClampingScrollPhysics(),
              onPageChanged: oneChange,
              children: [
                Image.asset("images/slider.jpg", fit: BoxFit.cover),
                Image.asset("images/slider3.png", fit: BoxFit.cover),
                Image.asset("images/image1.png", fit: BoxFit.cover),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: AlignmentGeometry.bottomCenter,
            child:
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: currentSlider == index ? 15 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlider == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                );
              }),
            ),
         
          ),
        ),
      ],
    );
  }
}
