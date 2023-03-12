import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TagContainer extends StatelessWidget {
  const TagContainer({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFC499BA),
            blurRadius: 5,
            // offset: Offset(-0.3, -5),

          )
        ],
          color: const Color(0xFFFFAACF),
          borderRadius: BorderRadius.circular(25.r)),
      child: Center(
        child: Text(
          '#$text',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
