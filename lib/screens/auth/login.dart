import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail_project/screens/home/home.dart';

import '../../api/Auth/auth_api_controller.dart';
import '../../utils/constant.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/social.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.h),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            CustomTextFiled(
              hintText: 'Enter email or username',
              controller: _emailController,
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomTextFiled(
              hintText: 'Password',
              obsecure: true,
              controller: _passwordController,
            ),
            SizedBox(
              height: 71.h,
            ),
            TextButton(
              onPressed: () async {
                print('data');

                await _performLogin();
              },
              child: Container(
                width: double.infinity,
                height: 48.h,
                child: Center(
                    child: loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'SIGN IN',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          )),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                        end: Alignment.centerLeft,
                        begin: Alignment.centerRight,
                        colors: [
                          primaryColor,
                          Color(0xff6589FF),
                        ])),
              ),
            ),
            SizedBox(
              height: 33.h,
            ),
            Center(
              child: Text(
                'OR',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: Color(0xffA8A7A7),
                ),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SocialMediaButton(
                  imgName: 'face',
                ),
                SocialMediaButton(
                  imgName: 'twitter',
                ),
                SocialMediaButton(
                  imgName: 'google',
                ),
              ],
            ),
            // SizedBox(
            //   height: 40.h,
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      print('dats : ${_emailController.text},,,${_passwordController.text}');

      return true;
    }
    print(
        'empty dats : ${_emailController.text},,,${_passwordController.text}');

    return false;
  }

  Future<void> _login() async {
    bool statues = await AuthApiController().login(
        email: _emailController.text,
        password: _passwordController.text,
        BuildContext: context);
    if (statues) {
      setState(() {
        loading = true;
      });
      Navigator.pushReplacementNamed(context, HomeScreen.id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Log in Successfully',
            style: TextStyle(fontSize: 22.sp),
          ),
          duration: Duration(seconds: 3),
          padding: EdgeInsets.all(22),
          backgroundColor: primaryColor,
        ),
      );
    }
    print('Status :: $statues');
  }
}
