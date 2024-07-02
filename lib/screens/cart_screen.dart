import 'package:flutter/material.dart';
import 'package:quickshop/cart_controller.dart';
import 'package:quickshop/cart_summary.dart';
import 'package:quickshop/screens/order_successful_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = CartProvider.of(context)!.controller;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListenableBuilder(
          listenable: controller,
          builder: (_, __) {
            return controller.cart.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.cart.length,
                            itemBuilder: (c, i) {
                              final product = controller.cart[i];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      height: 90.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(product.img),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  product.title,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(height: 8.0),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(width: 8.0),
                                                    BuildButton(
                                                      onPressed: () {
                                                        controller
                                                            .decreaseQuantity(
                                                                product);
                                                      },
                                                      action: '-',
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    Text(
                                                      'Qty: ${product.quantity}',
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    BuildButton(
                                                      onPressed: () {
                                                        controller
                                                            .increaseQuantity(
                                                                product);
                                                      },
                                                      action: '+',
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0.0,
                                      child: IconButton(
                                          onPressed: () {
                                            controller.deleteProduct(product);
                                          },
                                          icon:
                                              const Icon(Icons.delete_rounded)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const CartSummary(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            controller.clear();
                            await Navigator.of(context).pushNamed(
                              OrderSuccessfulScreen.orderScreen,
                            );
                            if (!context.mounted) return;
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Complete Order'),
                              SizedBox(width: 10),
                              Icon(Icons.price_check_rounded)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text(
                      'Nothing added to cart',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  );
          }),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({super.key, this.onPressed, required this.action});

  final void Function()? onPressed;
  final String action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          backgroundColor: Colors.black38,
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(
          action,
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
