import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail_project/utils/constant.dart';

class ActivityContainer extends StatelessWidget {
  final String content;

  ActivityContainer({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: inboxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 9.w,
                  ),
                  child: CircleAvatar(
                    radius: 12.r,
                    backgroundImage: AssetImage('images/user.jpg'),
                  ),
                ),
                Text(
                  'Hussam',
                  style: GoogleFonts.poppins(
                      fontSize: 18.0.sp, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                 "${ DateTime.now().hour.toString()}: ${ DateTime.now().minute.toString()}",
                  style: GoogleFonts.poppins(
                      fontSize: 12.0.sp, color: subTitleColor),
                ),
                SizedBox(
                  width: 8.w,
                ),
                FaIcon(
                  FontAwesomeIcons.angleRight,
                  size: 12,
                  color: subTitleColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 37.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: GoogleFonts.poppins(
                        fontSize: 14.0.sp, color: subTitleColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
