// import 'dart:html';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:pal_mail_project/screens/auth/login.dart';
import 'package:pal_mail_project/widget/custom_header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/Auth/auth_api_controller.dart';
import '../api/api_setting.dart';
import '../model/user.dart';
import '../utils/constant.dart';
import '../utils/prefs.dart';
import 'auth/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const id = 'profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _emailController = new TextEditingController();
  late TextEditingController _nameController = new TextEditingController();
  var response;
  @override
  void initState() {
    super.initState();
    _emailController.text = SharedPrefController().getEmail(key: 'email')!;
    // _emailController.text = response['name'];

    _nameController = new TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  XFile? xFile;
  ImagePicker _imagePicker = ImagePicker();
  Future<int> updateProfile(XFile file, name) async {
    String token = SharedPrefController().getValueFor('token');
    var request = http.MultipartRequest("POST", Uri.parse(ApiSettings.update));
//create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath('image', file.path);
    request.fields['name'] = name;
//add multipart to request
    request.files.add(pic);

    request.headers.addAll(
        {'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    var response = await request.send();

//Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);

    return response.statusCode;
  }

  // Future<List<User>> getUsers() async {
  //   String token = SharedPrefController().getValueFor('token');
  //
  //   Uri uri = Uri.parse('${ApiSettings.user}');
  //   var response =
  //       await http.get(uri, headers: {'Authorization': 'Bearer $token'});
  //   Map<String, dynamic> json = jsonDecode(response.body)['user'];
  //   print('dataaaaa  $json');
  //   List<User> user = [];
  //
  //   // print('${user} user name');
  //   if (response.statusCode == 200) {
  //     for (int i = 0; i < json.length; i++) {
  //       user.add(User.fromJson(json[i]));
  //     }
  //     return user;
  //   } else {
  //     throw Exception('Failed Get API');
  //   }
  // }
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                _logout();
              },
              icon: Icon(
                Icons.login_outlined,
                color: primaryColor,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 79.h),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () async {
                                pickImage();
                              },
                              child: Container(
                                child: xFile == null
                                    ? const CircleAvatar(
                                  radius: 54,
                                  child: Center(
                                    child:
                                    Icon(Icons.camera_alt_outlined),
                                  ),
                                )
                                    : Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(150),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(50),
                                      child: Image.file(
                                        File(SharedPrefController()
                                            .getValueFor('image') ??
                                            xFile!.path),
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100.h,
                              left: 85,
                              child: CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 15,
                                child: FaIcon(
                                  FontAwesomeIcons.penToSquare,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //first Name
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
              ),
              child: TextField(
                controller: _nameController,
                minLines: null,
                maxLines: null,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.name,
                expands: true,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxHeight: 60,
                  ),
                  hintText: SharedPrefController().getValueFor('name'),
                  floatingLabelStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  prefixIcon: Icon(Icons.perm_identity_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintMaxLines: 1,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            //email address
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 36,
              ),
              child: TextField(
                readOnly: true,
                controller: _emailController,
                minLines: null,
                maxLines: null,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                expands: true,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxHeight: 60,
                  ),
                  hintText: 'Email Address',
                  floatingLabelStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintMaxLines: 1,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 44,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: primaryColor,
                  minimumSize: Size(double.infinity, 60),
                ),
                onPressed: () async {
                  final SharedPreferences prefs =
                  await SharedPreferences.getInstance();

                  setState(() {
                    prefs.setString("name", _nameController.text);
                    prefs.setString("image", xFile!.path);
                  });
                  _performUpload();
                },
                child: loading
                    ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                    : Text(
                  'Update Profile',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }

  void _logout() async {
    String token = SharedPrefController().getValueFor('token');

    bool processResponse =
    await AuthApiController().logout(BuildContext: context);
    if (processResponse) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AuthScreen.id);
    }
    print('error$token');
  }

  Future<void> pickImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    XFile? pickedImage =
    await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        xFile = pickedImage;
        prefs.setString("image", xFile!.path);
      });
    }
  }

  Future<void> _performUpload() async {
    if (_checkData()) {
      setState(() {
        loading = true;
      });
      await uploadImage();
    }
  }

  bool _checkData() {
    if (xFile != null) {
      return true;
    }
    print('select image too upload');
    return false;
  }

  Future<void> uploadImage() async {
    int processResponse = await updateProfile(xFile!, _nameController.text);

    if (processResponse == 200) {
      print('success');
      Navigator.pop(context);
    } else {
      print('failed');
    }
  }
}
