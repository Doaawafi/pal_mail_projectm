import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/details_screen.dart';
import '../utils/constant.dart';

class OrganizationNameBox extends StatelessWidget {
  final String organizationName;
  final String date;
  final String subject;
  final String other;
  final bool isVisible;
  final Color color;
  final String? tags;
  final String? image;

  OrganizationNameBox({
    this.tags = '#Urgent  #Egyptian Military',
    this.image = 'images/example.jpg',
    required this.organizationName,
    required this.date,
    required this.subject,
    required this.other,
    required this.isVisible,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 9.w,
              ),
              child: CircleAvatar(
                backgroundColor: color,
                radius: 12.r,
              ),
            ),
            Text(
              organizationName,
              style: GoogleFonts.poppins(
                  fontSize: 18.0.sp, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Text(
              date,
              style:
                  GoogleFonts.poppins(fontSize: 12.0.sp, color: subTitleColor),
            ),
            SizedBox(
              width: 8.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, DetailsScreen.id);
              },
              child: FaIcon(
                FontAwesomeIcons.angleRight,
                size: 12,
                color: subTitleColor,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 37.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: GoogleFonts.poppins(
                  fontSize: 14.0.sp,
                ),
              ),
              Text(
                other,
                style: GoogleFonts.poppins(
                    fontSize: 14.0.sp, color: seconderyColor),
              ),
              SizedBox(
                height: 8.h,
              ),
              Visibility(
                visible: isVisible,
                child: Column(
                  children: [
                    Text(
                      tags!,
                      style: GoogleFonts.poppins(
                          fontSize: 14.0.sp,
                          color: seconderyColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            image!,
                            width: 36.w,
                            height: 36.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            image!,
                            width: 36.w,
                            height: 36.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
