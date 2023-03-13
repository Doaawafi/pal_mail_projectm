import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.hintText,
    this.obsecure = false,
    this.borderWidth = 1,
    this.isBold = FontWeight.normal,
    this.fontSize = 16,
    required this.controller,
  });
  final String hintText;
  final bool obsecure;
  final TextEditingController controller;
  final int borderWidth;
  final FontWeight isBold;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: borderWidth.w,
            color: Color(0xffEAEAF5),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff003AFC),
        )),
        hoverColor: Color(0xff003AFC),
        hintStyle: GoogleFonts.poppins(
          fontSize: fontSize.sp,
          fontWeight: isBold,
          color: Color(0xffB2B2B2),
        ),
      ),
    );
  }
}
