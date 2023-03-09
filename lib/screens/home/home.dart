import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pal_mail_project/screens/search_screen.dart';
import 'package:pal_mail_project/utils/constant.dart';

import '../../api/api_setting.dart';
import '../../utils/prefs.dart';
import '../../widget/category_widget.dart';
import '../../widget/organization_name_box.dart';
import '../../widget/search_box.dart';
import '../../widget/tag_container.dart';
import '../new_inbox.dart';
import '../profile.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List _loadedData = [];

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  final String organizationName = 'Organization Name',
      date = 'Today, 11:00 AM',
      other =
          'And here excerpt of the mail, can added to this location. And we can do more to this like …',
      subject = '  Here we add the subject',
      tags = '#Urgent  #Egyptian Military',
      image = 'images/example.jpg';

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    String token = SharedPrefController().getValueFor('token');

    final response = await http.get(
      Uri.parse(statusesURL),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final data = json.decode(response.body)['statuses'];

    setState(() {
      _loadedData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              left: 30,
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(Icons.menu),
                  onTap: () {
                    Navigator.pushNamed(context, Profile.id);
                  },
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SearchScreen.id);
                        },
                        icon: const Icon(Icons.search)),
                    const CircleAvatar(
                      backgroundImage: AssetImage('images/user.jpg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SearchBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _loadedData.isEmpty
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.5,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w),
                    itemCount: _loadedData.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                        color: int.parse(_loadedData[index]['color']),
                        text: _loadedData[index]['name'],
                        num: _loadedData[index]['mails_count'],
                      );
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
            child: Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.only(bottom: 20),
                initiallyExpanded: true,
                title: Text(
                  'Official Organization',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w600),
                ),
                children: [
                  Container(
                    decoration: inboxDecoration,
                    padding: const EdgeInsets.all(16),
                    child: OrganizationNameBox(
                      organizationName: organizationName,
                      date: date,
                      subject: subject,
                      other: other,
                      isVisible: true,
                      color: blueLightColor,
                      tags: tags,
                      image: image,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 36.w,
              top: 15.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'NGOs',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '12 ',
                      style: GoogleFonts.poppins(
                          color: subTitleColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    const FaIcon(
                      FontAwesomeIcons.angleRight,
                      size: 12,
                      color: subTitleColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
            child: Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Others',
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w600),
                ),
                children: [
                  Container(
                    decoration: inboxDecoration,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        OrganizationNameBox(
                          organizationName: organizationName,
                          date: date,
                          subject: subject,
                          other: other,
                          isVisible: false,
                          color: redCatColor,
                        ),
                        OrganizationNameBox(
                          organizationName: organizationName,
                          date: date,
                          subject: subject,
                          other: other,
                          isVisible: false,
                          color: yellowCatColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 36.w,
              left: 36.w,
              top: 15.h,
            ),
            child: Text(
              'Tags',
              style: GoogleFonts.poppins(
                  fontSize: 20.0.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Container(
              decoration: inboxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TagContainer(
                          text: 'All Tags',
                        ),
                        TagContainer(
                          text: '#Urgent ',
                        ),
                        TagContainer(
                          text: '#Egyptian Military ',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const TagContainer(
                      text: '#New ',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 57.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Color(0xffD0D0D0),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, NewInbox.id);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.circlePlus,
                      size: 24.sp,
                      color: seconderyColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, NewInbox.id);
                    },
                    child: Text(
                      ' New Inbox',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: seconderyColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
