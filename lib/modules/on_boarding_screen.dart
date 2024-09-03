import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 5000,
      splashIconSize: double.infinity,
      splash: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0XFF1b2640),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Download_Station.png",
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "Download Station DS",
              style: GoogleFonts.oswald(
                fontWeight: FontWeight.w400,
                textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 32,
                      color: const Color(0XFFc6f7f5),
                    ),
              ),
            ),
          ],
        ),
      ),
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.transparent,
    );
  }
}
