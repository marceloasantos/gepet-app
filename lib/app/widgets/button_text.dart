import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool? isLoading;
  final VoidCallback onPressed;

  const ButtonText({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: null != isLoading && isLoading!
          ? SpinKitThreeBounce(
              color: Colors.white,
              size: 15,
            )
          : Text(
              text,
              style: GoogleFonts.montserrat(
                color: textColor,
              ),
            ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
