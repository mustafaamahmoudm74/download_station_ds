import 'package:download_station_ds/modules/whatsapp_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/social_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1b2640),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Download_Station.png",
              ),
              const SizedBox(
                height: 42,
              ),
              Text(
                "Choose Your Download",
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.w700,
                  textStyle:
                      Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFFc6f7f5),
                          ),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              SocialButtonWidget(
                navigateScreen: WhatsAppStatusScreen(),
                buttonText: "WhatsApp",
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
