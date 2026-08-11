import 'food.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  List<Food> _foodMenu = [
    Food(
      name: "Sushi",
      imagePath: "lib/images/nigiri.png",
      price: "12.99",
      rating: "4.5",
    ),
    Food(
      name: "Ramen",
      imagePath: "lib/images/sushi.png",
      price: "9.99",
      rating: "4.2",
    ),
    Food(
      name: "Tempura",
      imagePath: "lib/images/sushi4.png",
      price: "11.99",
      rating: "4.0",
    ),
    Food(
      name: "Sashimi",
      imagePath: "lib/images/sushi2.png",
      price: "14.99",
      rating: "4.8",
    ),
    Food(
      name: "Udon",
      imagePath: "lib/images/sushi3.png",
      price: "10.99",
      rating: "4.3",
    ),
  ];

  // customer cart items
  List<Food> _cartItems = [];

  // getter method to access the cart items
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cartItems => _cartItems;

  // add item to cart
  void addToCart(Food food, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cartItems.add(food);
    }
    notifyListeners(); // Notify listeners about the change in cart items
  }

  // remove item from cart
  void removeFromCart(Food food) {
    _cartItems.remove(food);
    notifyListeners(); // Notify listeners about the change in cart items
  }
}
