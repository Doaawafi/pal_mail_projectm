import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail_project/screens/details_screen.dart';
import 'package:pal_mail_project/widget/search_box.dart';

import '../utils/constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isExpanded = false;
  bool isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Home',
          style: GoogleFonts.poppins(fontSize: 18, color: seconderyColor),
        ),
        leading: Icon(
          Icons.arrow_back_ios_sharp,
          size: 18.sp,
          color: seconderyColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '25 Completed',
                      style: GoogleFonts.poppins(
                          fontSize: 14.0.sp, color: Color(0xffB2B2B2)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Show",
                        style: GoogleFonts.poppins(
                            fontSize: 14.0.sp, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //   '25 Completed',
              //         style: GoogleFonts.poppins(
              //             fontSize: 14.0.sp, color: Color(0xffB2B2B2)),
              //       ),
              //       TextButton(
              //         onPressed: () {},
              //         child: Text(
              //           "1 found",
              //           style: GoogleFonts.poppins(
              //             fontSize: 14.0.sp,
              //             color: Color(0xffB2B2B2),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              ExpansionTile(
                initiallyExpanded: true,
                onExpansionChanged: (bool expanding) =>
                    setState(() => this.isExpanded = expanding),
                title: Text(
                  'Official Organization',
                  style: GoogleFonts.poppins(

                      fontSize: 18.0.sp, color: Color(0xffB2B2B2)),
                ),
                trailing:   TextButton(
                          onPressed: () {},
                          child: Text(
                            "1 found",
                            style: GoogleFonts.poppins(
                              fontSize: 14.0.sp,
                              color: Color(0xffB2B2B2),
                            ),
                          ),
                        ),
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(.1),
                            blurRadius: 6.0,
                            spreadRadius: 1.0,
                            offset: Offset(0.0, 0.0), // soften the shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.r)),
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
                                  backgroundColor: Colors.blue,
                                  radius: 12.r,
                                ),
                              ),
                              Text(
                                'Organization Name',
                                style: GoogleFonts.poppins(
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                'Today, 11:00 AM',
                                style: GoogleFonts.poppins(
                                    fontSize: 12.0.sp, color: subTitleColor),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, DetailsScreen.id);
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
                                  'Here we add the subject',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0.sp,
                                  ),
                                ),
                                Text(
                                  'And here excerpt of the mail, can added to this location. And we can do more to this like …',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.0.sp, color: seconderyColor),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '#Urgent  #Egyptian Military',
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
                                        'images/example.jpg',
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
                                        'images/example.jpg',
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
                  )
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Other  ',
              //         style: GoogleFonts.poppins(
              //             fontSize: 14.0.sp, color: Color(0xffB2B2B2)),
              //       ),
              //       TextButton(
              //         onPressed: () {},
              //         child: Text(
              //           "2 found",
              //           style: GoogleFonts.poppins(
              //             fontSize: 14.0.sp,
              //             color: Color(0xffB2B2B2),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              ExpansionTile(
                initiallyExpanded: true,
                onExpansionChanged: (bool expanding) =>
                    setState(() => this.isExpanded2 = expanding),
                title: Text(
                  'Others',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w600),
                ),
                trailing:Text("2 found"),
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(.1),
                            blurRadius: 6.0,
                            spreadRadius: 1.0,
                            offset: Offset(0.0, 0.0), // soften the shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.r)),
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
                                  backgroundColor: Colors.red,
                                  radius: 12.r,
                                ),
                              ),
                              Text(
                                'Organization Name',
                                style: GoogleFonts.poppins(
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                'Today, 11:00 AM',
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
                                  'Here we add the subject',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0.sp,
                                  ),
                                ),
                                Text(
                                  'And here excerpt of the mail, can added to this location. And we can do more to this like …',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.0.sp, color: seconderyColor),
                                ),
                                Divider(
                                  thickness: .3,
                                  color: subTitleColor,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 9.w,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  radius: 12.r,
                                ),
                              ),
                              Text(
                                'Organization Name',
                                style: GoogleFonts.poppins(
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                'Today, 11:00 AM',
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
                                  'Here we add the subject',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0.sp,
                                  ),
                                ),
                                Text(
                                  'And here excerpt of the mail, can added to this location. And we can do more to this like …',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14.0.sp, color: seconderyColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
