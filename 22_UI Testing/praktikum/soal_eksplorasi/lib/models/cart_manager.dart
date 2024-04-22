import 'package:flutter/material.dart';

class CartManager extends ChangeNotifier {
  final List<String> _cartList = [];
  List<String> get cartList => _cartList;

  void complete(String productName) {
    _cartList.add(productName);
    notifyListeners();
  }
}