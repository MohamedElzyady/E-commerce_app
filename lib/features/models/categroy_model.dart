class CategroyModel {
  final String title;
  final String image;
  CategroyModel({required this.image, required this.title});

  static List<CategroyModel> items = [
    CategroyModel(image: "images/jewelry.png", title: "jewelry"),
    CategroyModel(image: "images/beauty.png", title: "beauty"),
    CategroyModel(image: "images/shoes.png", title: "shoes"),
    CategroyModel(image: "images/men.png", title: "men"),
    CategroyModel(image: "images/image1.png", title: "women"),
  ];
}
