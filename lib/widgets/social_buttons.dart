import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButtonWidget extends StatelessWidget {
  final String buttonText;
  final Widget navigateScreen;

  const SocialButtonWidget(
      {super.key, required this.navigateScreen, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF376928),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => navigateScreen));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/whatsapp.svg",
              width: 44,
              height: 44,
            ),
            const SizedBox(
              width: 32,
            ),
            Text(
              buttonText,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 32,
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
