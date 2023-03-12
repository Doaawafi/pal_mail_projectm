import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../api/Auth/auth_api_controller.dart';
import '../../model/user.dart';
import '../../utils/constant.dart';
import '../../widget/custom_text_filed.dart';
import '../../widget/social.dart';
import '../home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const id = 'SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _ConfirmpasswordController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    _ConfirmpasswordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _ConfirmpasswordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              CustomTextFiled(
                hintText: 'Enter email',
                controller: _emailController,
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomTextFiled(
                hintText: 'Enter username',
                controller: _nameController,
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomTextFiled(
                hintText: 'Password',
                obsecure: true,
                controller: _passwordController,
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomTextFiled(
                hintText: 'Confirm password',
                obsecure: true,
                controller: _ConfirmpasswordController,
              ),
              SizedBox(
                height: 50.h,
              ),
              TextButton(
                onPressed: () async {
                  await _performRegister();
                },
                child: Container(
                  width: double.infinity,
                  height: 55.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient:
                          const LinearGradient(begin: Alignment.bottomLeft, colors: [
                        primaryColor,
                        Color(0xff6F4A8E),
                      ])),
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Center(
                          child: Text(
                          'SIGN UP',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        )),
                ),
              ),
              SizedBox(
                height: 25.h,
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
                height: 20.h,
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
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _ConfirmpasswordController.text.isNotEmpty) {
      return true;
    }
    print('empty dats : ${_nameController.text},,,${_passwordController.text}');
    return false;
  }

  _register() async {
    bool statues = await AuthApiController().register(
      user: user,
      BuildContext: context,
    );
    print(' statues ::: $statues');
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
                                  'Sign up Successfully',
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
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(
      //       'Sign upSuccessfully',
      //       style: TextStyle(fontSize: 22.sp),
      //     ),
      //     duration: Duration(seconds: 3),
      //     padding: EdgeInsets.all(22),
      //     backgroundColor: primaryColor,
      //   ),
      // );
    }

  }

  User get user {
    User user = User();
    user.email = _emailController.text;
    user.name = _nameController.text;
    user.password = _passwordController.text;
    user.Conpassword = _ConfirmpasswordController.text;
    return user;
  }
}
