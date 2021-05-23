import 'package:flutter/material.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const InputText({
    Key? key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      style: GoogleFonts.montserrat(fontSize: 16, color: AppColors.grayDark),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintText: hintText,
        fillColor: AppColors.grayMedium,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
