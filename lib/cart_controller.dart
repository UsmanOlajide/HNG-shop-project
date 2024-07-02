import 'package:flutter/material.dart';
import 'package:quickshop/models/product.dart';

class CartController extends ChangeNotifier {
  final _cart = <Product>[];

  List<Product> get cart => _cart;

  bool isPresent(int productId) =>
      _cart.indexWhere((item) => item.id == productId) > -1;

  void add(Product product) {
    final existingIndex = _cart.indexWhere((item) => item.id == product.id);
    if (existingIndex >= 0) {
      deleteProduct(product);
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    final existingIndex = _cart.indexWhere((item) => item.id == product.id);
    if (existingIndex == 1) return;
    _cart[existingIndex].quantity++;

    notifyListeners();
  }

  void decreaseQuantity(Product product) {
    final existingIndex = _cart.indexWhere((item) => item.id == product.id);
    if (existingIndex < 0) return;
    if (_cart[existingIndex].quantity == 1) return;
    _cart[existingIndex].quantity--;
    notifyListeners();
  }

  void deleteProduct(Product product) {
    _cart.removeWhere((item) {
      return product.id == item.id;
    });
    notifyListeners();
  }

  void clear() {
    _cart.clear();
    notifyListeners();
  }

  double get delivery => 20.0;

  double _subtotalCost() {
    try {
      return _cart
          .map((plant) => plant.price)
          .reduce((prev, next) => prev + next);
    } catch (e) {
      return 0.0;
    }
  }

  String subtotalCost() {
    return '\$${_subtotalCost().toStringAsFixed(2)}';
  }

  String totalCost() {
    return '\$${(_subtotalCost() + delivery).toStringAsFixed(2)}';
  }
}

class CartProvider extends InheritedWidget {
  const CartProvider({
    super.key,
    required this.controller,
    required super.child,
  });
  final CartController controller;

  static CartProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CartProvider>();

  @override
  bool updateShouldNotify(covariant CartProvider oldWidget) =>
      controller != oldWidget.controller;
}
