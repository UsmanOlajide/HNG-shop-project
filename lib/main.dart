import 'package:flutter/material.dart';
import 'package:quickshop/cart_controller.dart';
import 'package:quickshop/screens/order_successful_screen.dart';
import 'package:quickshop/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      controller: CartController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const CartScreen(),
        routes: {
          '/': (context) => const Tabs(),
          OrderSuccessfulScreen.orderScreen: (context) =>
              const OrderSuccessfulScreen(),
        },
      ),
    );
  }
}
