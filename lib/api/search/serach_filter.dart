import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail_project/utils/constant.dart';
import 'package:pal_mail_project/widget/custom_header.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);
  static const String id = "SearchFilter";

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(title: ' Filter '),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: roundedBox,
                margin: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Officail organization",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.check)
                      ],
                    ),
                    const Divider(),
                   const Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "NGOs",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(),
                    const    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "UnBorder",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Divider(),
                    const     Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Others",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              const     SizedBox(
                height: 5,
              ),
              Container(
                decoration: roundedBox,
                margin: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatuseWidget(
                      text: 'Inbox',
                      color: redCatColor,
                    ),
                    const Divider(),
                    StatuseWidget(
                      text: 'Pending',
                      color: yellowCatColor,
                    ),
                    const Divider(),
                    StatuseWidget(
                      text: 'In Progress',
                      color: blueLightColor,
                    ),
                    const Divider(),
                    StatuseWidget(
                      text: 'Completed',
                      color: greenCatColor,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: roundedBox,
                margin: EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 9.w,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.calendar,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.poppins(
                            fontSize: 18.0.sp,
                          ),
                        ),
                        Text(
                          'Tuesday, July 5, 2022',
                          style: GoogleFonts.poppins(
                            fontSize: 14.0.sp,
                            color: seconderyColor,
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
      ),
    );
  }
}

class StatuseWidget extends StatelessWidget {
  String text;
  Color color;

  StatuseWidget({
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 39, left: 16, top: 20),
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
