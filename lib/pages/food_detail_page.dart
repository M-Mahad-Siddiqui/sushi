import "package:app/components/button.dart";
import "package:app/models/food.dart";
import "package:app/models/shop.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";

import "../theme/colors.dart";

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 0;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  void addToCart() {
    // only add to cart if quantity is greater than 0
    if (quantity > 0) {
      // get access to cart items from the shop
      final shop = context.read<Shop>();

      // add the food item to the cart
      shop.addToCart(widget.food, quantity);

      // let the user know that the item has been added to the cart
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: primaryColor,

            title: const Text(
              "Added to Cart",
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              "${widget.food.name} has been added to your cart with quantity $quantity.",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // pop once to removed dialog box
                  Navigator.pop(context);

                  // pop again to go back to the previous page
                  Navigator.pop(context);

                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.check, color: Colors.white),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Detail')),
      body: Column(
        children: [
          // list view of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),

                  // rating
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 5),
                      Text(widget.food.rating),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),

                  // food description
                  const SizedBox(height: 12),
                  Text(
                    "Description",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Delicious sushi made with fresh ingredients. Perfect for sushi lovers!. The sushi is made with fresh fish and rice, and is served with a variety of sauces and toppings. The sushi is also available in a variety of flavors, including spicy tuna, salmon, and shrimp.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                // price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$${widget.food.price}",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // quantity
                    Row(
                      children: [
                        IconButton(
                          onPressed: decreaseQuantity,
                          icon: const Icon(Icons.remove),
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          quantity.toString(),
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: increaseQuantity,
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),

                //add to cart button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: "Add to Cart",
                    onPressed: addToCart,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
