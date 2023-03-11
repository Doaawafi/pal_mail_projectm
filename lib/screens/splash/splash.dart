import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail_project/utils/constant.dart';

import '../../utils/prefs.dart';
import '../auth/auth.dart';
import '../home/home.dart';
import '../onboarding.dart';

class SplachScreen extends StatefulWidget {
  static const String id = 'SplachScreen';

  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        String route =
            SharedPrefController().LoggedIn ? HomeScreen.id : OnBoarding.id;
        Navigator.pushReplacementNamed(context, route);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(end: Alignment.bottomLeft, colors: [
          primaryColor,
          Color(0xffE8E2E2),
        ])),
        child: Column(
          children: [
            SizedBox(
              height: 292.h,
            ),
            Center(
              child: Image.asset(
                'images/loo.png',
                width: 300.w,
                height: 300.h,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            // Center(
            //     child: Text(
            //   'ديوان رئيس الوزراء',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 31.sp,
            //     fontWeight: FontWeight.w400,
            //   ),
            // )),
          ],
        ),
      ),
    );
  }
}
