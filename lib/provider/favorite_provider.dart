import 'package:e_commerce_app/models/product_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProductModel> _favorite = [];
  List<ProductModel> get favorits => _favorite;
  void toggleFavorit(ProductModel prodeuct) {
    if (_favorite.contains(prodeuct)) {
      _favorite.remove(prodeuct);
    } else {
      _favorite.add(prodeuct);
    }
    notifyListeners();
  }

  bool isExist(ProductModel prodeuct) {
    final isExist = _favorite.contains(prodeuct);
    return isExist;
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
