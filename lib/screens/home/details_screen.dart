import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail_project/screens/home/home.dart';
import 'package:pal_mail_project/screens/status.dart';

import '../../utils/constant.dart';
import '../../widget/activity_box.dart';
import '../../widget/bottom_sheet.dart';
import '../../widget/category_container.dart';

class DetailsScreen extends StatefulWidget {
  static const String id = "DetailsScreen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isExpanded = false;
  bool isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 39.h,
              bottom: 16.h,
              left: 22.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: const Color(0xff6589FF),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 25.sp, color: const Color(0xff6589FF)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 22.0),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      // show here one is more_horiz and other is the word Done
                      child: Icon(Icons.more_horiz,
                          size: 24, color: Color(0xff6589FF))),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Container(
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
                          child: Icon(
                            Icons.perm_identity,
                            color: Color(0xff707070),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Sport Ministry',
                              style: GoogleFonts.poppins(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Official organization',
                              style: GoogleFonts.poppins(
                                  fontSize: 14.0.sp, color: Color(0xffB2B2B2)),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'Today, 11:00 AM',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0.sp,
                                  color: Color(0xffB2B2B2)),
                            ),
                            Text(
                              'Arch 2022/1032',
                              style: GoogleFonts.poppins(
                                  fontSize: 12.0.sp, color: Color(0xffB2B2B2)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: .3,
                      color: subTitleColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.h),
                      child: Theme(
                        data: ThemeData()
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          title: InkWell(
                            onTap: () {
                              showBottomSheet(context);
                            },
                            child: Text(
                              'Title of mail',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          trailing: FaIcon(
                            isExpanded
                                ? FontAwesomeIcons.angleUp
                                : FontAwesomeIcons.angleDown,
                            size: 16,
                            color: isExpanded ? seconderyColor : subTitleColor,
                          ),
                          children: <Widget>[
                            SizedBox(
                              height: 114.h,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  'Lorem Ipsum is simply dummy text of '
                                  'the printing and typesetting industry. Lorem Ipsum'
                                  ' has been the industry’s standard dummy text ever '
                                  'since the 1500s, when an unknown printer took a galley '
                                  'of type and scrambled it to make a type specimen book. '
                                  'It has survived not only five centuries, '
                                  'but also the leap into electronic typesetting,'
                                  ' remaining essentially unchanged. It was popularised'
                                  ' in the 1960s with the release of Letraset sheets containing'
                                  ' Lorem Ipsum passages, and more recently with desktop publishing '
                                  'software like Aldus PageMaker including versions of Lorem'
                                  ' Ipsum.Why do we use it?It is a long established fact that'
                                  ' a reader will be distra',
                                  overflow: TextOverflow.clip,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.0.sp,
                                      color: Color(0xff898989),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: inboxDecoration,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                      ),
                      child: Text(
                        '#',
                        style: GoogleFonts.poppins(
                            color: Color(0xff707070),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      '#Urgent ',
                      style: GoogleFonts.poppins(
                          color: Color(0xff959595),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '#Egyptian Military ',
                      style: GoogleFonts.poppins(
                          color: Color(0xff959595),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: subTitleColor,
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            decoration: inboxDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: FaIcon(
                        FontAwesomeIcons.tag,
                        size: 24.sp,
                        color: const Color(0xff707070),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    CategoryContainer(
                      text: 'pending',
                      color: yellowCatColor, fontColor: Colors.black,
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, StatusScreen.id);
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: subTitleColor,
                    ))
              ],
            ),
          ),
          Container(
            decoration: inboxDecoration,
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Decision',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 49.h,
                  child: Text(
                    'Lorem Ipsum is simply dummy text of '
                    'the printing and typesetting industry. Lorem Ipsum'
                    ' has been the industry’s standard dummy text ever '
                    'since the 1500s, when an unknown printer took a galley '
                    'of type and scrambled it to make a type specimen book. '
                    'It has survived not only five centuries, '
                    'but also the leap into electronic typesetting,'
                    ' remaining essentially unchanged. It was popularised'
                    ' in the 1960s with the release of Letraset sheets containing'
                    ' Lorem Ipsum passages, and more recently with desktop publishing '
                    'software like Aldus PageMaker including versions of Lorem'
                    ' Ipsum.Why do we use it?It is a long established fact that'
                    ' a reader will be distra',
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.poppins(
                      fontSize: 14.0.sp,
                      color: Color(0xff898989),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            padding: const EdgeInsets.all(8),
            decoration: inboxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Image',
                  style: GoogleFonts.poppins(
                    color: seconderyColor,
                    fontSize: 16.0.sp,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.circleMinus,
                            size: 24.sp,
                            color: Colors.red,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            'images/example.jpg',
                            width: 32.w,
                            height: 32.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          'Image',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0.sp,
                          ),
                        ),
                        SizedBox(
                          width: 145.w,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Color(0xffC6C6C6),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 85.w, bottom: 0),
                      child: Divider(
                        color: Color(0xffD0D0D0),
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.circleMinus,
                            size: 24.sp,
                            color: Colors.red,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            'images/example.jpg',
                            width: 32.w,
                            height: 32.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          'Image',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16.0.sp,
                          ),
                        ),
                        SizedBox(
                          width: 145.w,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Color(0xffC6C6C6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Activity',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600),
              ),
              children: [
                ActivityBox(
                  name: 'Ali',
                  date: 'Today, 11:00 AM',
                  details: 'The issue transferred to AAAA',
                  image: 'images/user.jpg',
                ),
                SizedBox(
                  height: 8.h,
                ),
                ActivityBox(
                  name: 'Ali',
                  date: 'Today, 11:00 AM',
                  details: 'The issue transferred to AAAA',
                  image: 'images/user.jpg',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              maxLines: null,
              minLines: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffEEEEF6),
                  hintText: 'Add new Activity …',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Color(0xffAFAFAF),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.h,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.paperPlane,
                        color: primaryColor,
                      )),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 9.w, left: 16.w),
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundImage: AssetImage(
                        'images/user.jpg',
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(50.r)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 167.h,
          )
        ],
      ),
    );
  }
}

void showBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BottomSheetWidget();
      });
}
