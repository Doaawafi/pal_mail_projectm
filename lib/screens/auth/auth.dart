import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail_project/screens/auth/sign_up.dart';

import '../../utils/constant.dart';
import 'login.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String id = 'auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum filterStatues { LogIn, SignUp }

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 850),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 359.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            primaryColor,
                            Color(0xff6F4A8E),
                          ]),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(110.r),
                        bottomLeft: Radius.circular(110.r),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                          width: 200.w,
                          height: 150.h,
                          child: Image.asset(
                            'images/loo.png',
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 150, right: 30, left: 30, bottom: 0),
                    child: Container(
                      height: _tabController.index == 1 ? 609.h : 620.h,
                      width: 367.w,
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                        )
                      ], borderRadius: BorderRadius.circular(60.r)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 40.h, right: 54.w, left: 54.w, bottom: 0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    30.0.r,
                                  ),
                                  border: Border.all(color: Colors.grey)),
                              child: TabBar(
                                // dividerColor: Colors.transparent,
                                // indicatorSize: TabBarIndicatorSize.tab,

                                controller: _tabController,
                                labelColor: Colors.grey[200],
                                // give the indicator a decoration (color and border radius)
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    22.0.r,
                                  ),
                                  color: primaryColor,
                                ),
                                unselectedLabelColor: primaryColor,
                                tabs: [
                                  Tab(
                                    text: 'Log In',
                                    height: 32.h,
                                  ),
                                  Tab(
                                    text: 'sign up',
                                    height: 32.h,
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: const [
                                  // first tab bar view widget
                                  Login(),
                                  // second tab bar view widget
                                  SignUp(),
                                ],
                              ),
                            ), // Container(
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CurvedBottomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // I've taken approximate height of curved part of view
//     // Change it if you have exact spec for it
//     final roundingHeight = size.height * 3 / 5;
//
//     // this is top part of path, rectangle without any rounding
//     final filledRectangle =
//         Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
//
//     // this is rectangle that will be used to draw arc
//     // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
//     // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
//     final roundingRectangle = Rect.fromLTRB(
//         -20, size.height - roundingHeight * 2, size.width + 5, size.height);
//
//     final path = Path();
//     path.addRect(filledRectangle);
//
//     // so as I wrote before: arc is drawn from center of roundingRectangle
//     // 2nd and 3rd arguments are angles from center to arc start and end points
//     // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
//     path.arcTo(roundingRectangle, pi, -pi, true);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
//     // basically that means that clipping will be redrawn on any changes
//     return true;
//   }
// }
