import 'package:flutter/material.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  const OrderSuccessfulScreen({super.key});

  static const orderScreen = 'order-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const Text(
              'Order Completed',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Buy more products'),
            )
          ],
        ),
      ),
    );
  }
}
