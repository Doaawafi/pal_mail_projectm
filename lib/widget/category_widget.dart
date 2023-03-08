import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constant.dart';

class CategoryWidget extends StatelessWidget {
  final int color;
  final String text;

  final String num;
  CategoryWidget({
    required this.color,
    required this.text,
    super.key,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: blueLightColor,
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0.w,
                  right: 16.0.w,
                  top: 16.h,
                  bottom: 0,
                ),
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundColor: Color(color),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 14, bottom: 9),
                child: Text(
                  '$num',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
