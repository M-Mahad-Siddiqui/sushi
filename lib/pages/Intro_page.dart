import 'package:app/components/button.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Shop name
              Text(
                "SUSHI SHOP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Image
              Center(
                child: Image.asset(
                  'lib/images/sushi1.png',
                  width: 200,
                  height: 200,
                ),
              ),

              // Title
              Text(
                "THE TASTE OF JAPANESE CUISINE FOOD",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Subtitle
              Text(
                "Feel the authentic taste of Japanese cuisine with our delicious sushi and other traditional dishes.",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              ),

              // Get Started button
              CustomButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.pushNamed(context, '/menupage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
