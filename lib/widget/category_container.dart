import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryContainer extends StatelessWidget {
  final String text;
  final Color color;

  const CategoryContainer({
    required this.text,
    required this.color,
    super.key, required Color fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(30.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 15.w),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: Colors.black),
        ),
      ),
    );
  }
}
