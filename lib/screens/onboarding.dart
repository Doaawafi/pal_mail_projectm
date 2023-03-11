import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/content.dart';
import 'auth/auth.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static const id = 'OnBoarding';
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int currentPage) {
                  setState(() => _currentPage = currentPage);
                },
                children: [
                  OnBoardingContent(
                    image: 's1',
                    content:
                        'A world without consultation is meaningless, so message everything now!',
                  ),
                  OnBoardingContent(
                    image: 's2',
                    content:
                        'We are close to you to make the decision to solve your problems',
                  ),
                  OnBoardingContent(
                    image: 's3',
                    content:
                        'Don\'t worry about your messages and problems, we are here to help you',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: _currentPage == 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AuthScreen.id);
                  },
                  child: Text('Get Statrted'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff9e59aa),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
