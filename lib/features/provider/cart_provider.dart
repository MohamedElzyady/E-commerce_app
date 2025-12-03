import 'package:e_commerce_app/features/models/product_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _cart = [];
  List<ProductModel> get cart => _cart;
  void toggleFavorit(ProductModel prodeuct) {
    if (_cart.contains(prodeuct)) {
      for (ProductModel element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(prodeuct);
    }
    notifyListeners();
  }

  incrementQtn(int index) {
    _cart[index].quantity++;
  }

  decremenQtn(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
    } else {
      return;
    }
  }

totalPrice( ){
  double total1 = 0.0;
  for (ProductModel element in _cart) {
    total1 += element.price * element.quantity;
  }
  return total1;
}
  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
