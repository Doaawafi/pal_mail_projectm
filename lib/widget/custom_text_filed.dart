import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.hintText,
    this.obsecure = false,
    required this.controller,
  });
  final String hintText;
  final bool obsecure;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(
            width: 1.w,
            color: const Color(0xffEAEAF5),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xff003AFC),
        )),
        hoverColor: const Color(0xff003AFC),
        hintStyle: GoogleFonts.poppins(
          fontSize: 15.sp,
          color: const Color(0xffB2B2B2),
        ),
      ),
    );
  }
}
