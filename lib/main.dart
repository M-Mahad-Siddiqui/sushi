import 'package:app/pages/Intro_page.dart';
import 'package:app/pages/menu_page.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/cart_page.dart';
import 'models/shop.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Shop(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      home: IntroPage(),

      routes: {
        '/intro': (context) => IntroPage(),
        '/menupage': (context) => MenuPage(),
        '/cartpage': (context) => CartPage(),
      },
    );
  }
}
