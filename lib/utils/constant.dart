import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color primaryColor = Color(0xff9e59aa);
// const Color primaryColor = Color(0xff003AFC);
const Color backgroundColor = Color(0xffF7F6FF);
const Color blueLightColor = Color(0xff6589FF);
const Color seconderyColor = Color(0xff6589FF);
const Color subTitleColor = Color(0xffB2B2B2);
const Color redCatColor = Color(0xffFA3A57);
const Color yellowCatColor = Color(0xffFFE120);
const Color greenCatColor = Color(0xff77D16F);

BoxDecoration roundedBox = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(35.r),
  ),
);

BoxDecoration inboxDecoration = BoxDecoration(boxShadow: [
  BoxShadow(
    color: primaryColor.withOpacity(.1),
    blurRadius: 6.0,
    spreadRadius: 1.0,
    offset: const Offset(0.0, 0.0), // soften the shadow
  ),
], color: Colors.white, borderRadius: BorderRadius.circular(30.r));

List<BoxShadow> shadow = [
  BoxShadow(
    color: blueLightColor.withOpacity(0.7),
    blurRadius: 10,
    spreadRadius: 0.3,
    offset: const Offset(
      0.0, // Move to right 5  horizontally
      1.0, // Move to bottom 5 Vertically
    ),
  ),
];
