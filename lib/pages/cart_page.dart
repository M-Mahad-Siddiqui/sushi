import 'package:app/models/food.dart';
import 'package:app/models/shop.dart';
import 'package:app/components/button.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) {
        final cartItems = shop.cartItems;

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 87, 60, 60),
          appBar: AppBar(
            title: const Text('My Cart'),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: cartItems.isEmpty
                      ? const Center(
                          child: Text(
                            'Your cart is empty.',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final Food food = cartItems[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  food.imagePath,
                                  width: 50,
                                  height: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.food_bank,
                                      size: 50,
                                    );
                                  },
                                ),
                                title: Text(food.name),
                                subtitle: Text('\$${food.price}'),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove_circle),
                                  onPressed: () => shop.removeFromCart(food),
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    text: 'Proceed to Payment',
                    onPressed: () {
                      // handle payment logic
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
