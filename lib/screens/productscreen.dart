import 'package:flutter/material.dart';
import 'package:quickshop/cart_controller.dart';
import 'package:quickshop/models/product.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({super.key});

  // final void Function()? onPressed;
  // final void Function() addItem;
  // final void Function(Product item) addItem;

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  @override
  Widget build(BuildContext context) {
    final controller = CartProvider.of(context)!.controller;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          'QuickShop',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, top: 20.0, left: 20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  mainAxisSpacing: 50.0,
                  crossAxisSpacing: 15.0,
                ),
                itemBuilder: (context, i) {
                  return ListenableBuilder(
                      listenable: controller,
                      builder: (_, __) {
                        return Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                        image: AssetImage(products[i].img),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        onPressed: () {
                                          controller.add(products[i]);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration: Durations.short4,
                                              content: Text(
                                                  'Added ${products[i].title}'),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          controller.isPresent(products[i].id)
                                              ? Icons.remove_shopping_cart
                                              : Icons.add_shopping_cart,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const SizedBox(height: 10.0),
                            Text(
                              products[i].title,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              '\$${products[i].price}',
                              style: const TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
