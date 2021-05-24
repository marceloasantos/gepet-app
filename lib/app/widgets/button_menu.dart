import 'package:flutter/material.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonMenu extends StatelessWidget {
  final int index;
  final String text;
  final String icon;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const ButtonMenu({
    Key? key,
    required this.index,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        children: [
          SizedBox(width: 10),
          Text(icon),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.montserrat(
              color: textColor,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor,
          ),
          overlayColor:
              MaterialStateProperty.all(AppColors.brownLight.withOpacity(0.5))),
      onPressed: onPressed,
    );
  }
}
