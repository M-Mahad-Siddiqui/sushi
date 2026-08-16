import 'package:app/components/button.dart';
import 'package:app/components/food_tile.dart';
import 'package:app/models/food.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_detail_page.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

void navigateToFoodDetailPage(BuildContext context, int index) {
  // get the shop and its menu
  final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FoodDetailPage(food: foodMenu[index]),
    ),
  );
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade800,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tokyo Sushi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Promo Banner
          Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                // Left side
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Get 32% Promo",
                        style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(text: "Redeem", onPressed: () {}),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Right side
                Image.asset('lib/images/sushi.png', width: 100, height: 100),
              ],
            ),
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 1.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for food",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          // Menu list
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Food Menu",
              style: GoogleFonts.dmSerifDisplay(
                color: Colors.grey.shade800,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetailPage(context, index),
                ),
              ),
            ),
          ),

          // Popular foods
          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'lib/images/sushi1.png',
                    height: 60,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),

                // Name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Salmon Eggs",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "\$21.00",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 71, 61, 58),
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 25),

                // Favorite icon
                const Icon(Icons.favorite_border, color: Colors.grey, size: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
