import 'package:animated_text_kit/animated_text_kit.dart';
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
              hintText: 'Enter email ',
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
                height: 55.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: const LinearGradient(
                        end: Alignment.centerLeft,
                        begin: Alignment.centerRight,
                        colors: [
                          primaryColor,
                          Color(0xff6F4A8E),
                        ])),
                child:  Center(
                    child: loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'SIGN IN',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          )),
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
              children: const [
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
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  height:80,
                  decoration:  BoxDecoration(
                      color: Colors.green.shade400,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 48.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("YAAH!!!",style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                            AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Log in successfully',
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  speed: const Duration(milliseconds: 40),
                                ),
                              ],

                              totalRepeatCount: 4,
                            ),

                            // Text("Please,Enter tags to add",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                        child: Image.asset("images/c.png",height: 60,width: 60))),
                Positioned(
                    top: -20,
                    left: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("images/close.png",height: 40,width: 50,color: Colors.green.shade300,),
                        const Icon(Icons.done)
                        // Image.asset("images/ss.png",height: 40,width: 25),
                      ],
                    ))
                // SvgPicture.asset("images/svg/error.svg",height: 48,width: 40,color: Colors.white,)
              ],
            ),
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            duration:const  Duration(
              milliseconds: 10000,
            ),


          ));
      return true;
    }
    print(
        'empty dats : ${_emailController.text},,,${_passwordController.text}');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height:80,
                decoration:  BoxDecoration(
                    color: Colors.red.shade500,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 48.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("OOH!!!",style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Please verify your login information',
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                speed: const Duration(milliseconds: 40),
                              ),
                            ],

                            totalRepeatCount: 4,
                          ),

                          // Text("Please,Enter tags to add",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                      child: Image.asset("images/c.png",height: 60,width: 60))),
              Positioned(
                  top: -20,
                  left: 0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("images/close.png",height: 40,width: 50,color: Colors.red.shade400,),
                      const Icon(Icons.close)
                      // Image.asset("images/ss.png",height: 40,width: 25),
                    ],
                  ))
              // SvgPicture.asset("images/svg/error.svg",height: 48,width: 40,color: Colors.white,)
            ],
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          duration:const  Duration(
            milliseconds: 10000,
          ),


        ));

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
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  height:80,
                  decoration:  BoxDecoration(
                      color: Colors.green.shade500,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 48.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("OOH!!!",style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                            AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Log in Successfully',
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  speed: const Duration(milliseconds: 40),
                                ),
                              ],

                              totalRepeatCount: 4,
                            ),

                            // Text("Please,Enter tags to add",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                        child: Image.asset("images/c.png",height: 60,width: 60))),
                Positioned(
                    top: -20,
                    left: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset("images/close.png",height: 40,width: 50,color: Colors.green.shade400,),
                        const Icon(Icons.done)
                        // Image.asset("images/ss.png",height: 40,width: 25),
                      ],
                    ))
                // SvgPicture.asset("images/svg/error.svg",height: 48,width: 40,color: Colors.white,)
              ],
            ),
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            elevation: 0,
            duration:const  Duration(
              milliseconds: 10000,
            ),


          ));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       'Log in Successfully',
      //       style: TextStyle(fontSize: 22.sp),
      //     ),
      //     duration: Duration(seconds: 3),
      //     padding: EdgeInsets.all(22),
      //     backgroundColor: primaryColor,
      //   ),
      // );
    }
    print('Status :: $statues');
  }
}
