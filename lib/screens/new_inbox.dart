import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:pal_mail_project/screens/sender_search.dart';
import 'package:pal_mail_project/screens/status.dart';
import 'package:pal_mail_project/screens/tag_screen.dart';
import 'package:pal_mail_project/widget/custom_text_filed.dart';

import '../api/sender_api_controller.dart';
import '../utils/constant.dart';
import '../utils/prefs.dart';
import '../widget/activityContainter .dart';
import '../widget/category_container.dart';
import '../widget/custom_header.dart';
import 'category.dart';
import 'package:http/http.dart' as http;

class NewInbox extends StatefulWidget {
  static const id = 'NewInbox';
  final String catName;
  NewInbox({Key? key, this.catName = '1'}) : super(key: key);

  @override
  State<NewInbox> createState() => _NewInboxState();
}

class _NewInboxState extends State<NewInbox> {
  TextEditingController controller = TextEditingController();
  bool isExpanded2 = false;
  XFile? xFile;
  ImagePicker _imagePicker = ImagePicker();
  List<ActivityContainer> activity = [];
  bool loading = false;
  late File _imageFile;
  DateTime? date = DateTime.now();

  final TextEditingController _senderController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _decisionController = TextEditingController();
  final TextEditingController _archiveController = TextEditingController();
  final TextEditingController _activityController = TextEditingController();
  final key = GlobalKey<ScaffoldState>();

  // File? image;
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _senderController.dispose();
    _mobileController.dispose();
    _subjectController.dispose();
    _descriptionController.dispose();
    _senderController.dispose();
    _archiveController.dispose();
    _decisionController.dispose();
    _activityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    String mobile = '';
    if (args != null) {
      print('ARGS ::: $args ');

      print(
          'SenderApiController.getingleSenderMobile(args) ======== ${SenderApiController.getSingleSenderMobile(args[0])}');
    }
    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              CustomHeader(
                title: 'New Inbox',
                onPressed: () {
                  SenderApiController.createSender(
                          _senderController.text,
                          _mobileController.text,
                          '2',
                          _subjectController.text,
                          _descriptionController.text,
                          _archiveController.text,
                          date,
                          _decisionController.text,
                          '1')
                      .then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Sender and Mail created done',
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                  duration: Duration(seconds: 3),
                                  padding: EdgeInsets.all(22),
                                  backgroundColor: primaryColor,
                                ),
                              ));

                  // SharedPrefController().getValueFor('id')
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: inboxDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: 9.w,
                            ),
                            child: Icon(
                              Icons.perm_identity,
                              color: Color(0xff707070),
                            ),
                          ),
                          Expanded(
                            child: args == null
                                ? CustomTextFiled(
                                    hintText: 'Sender ',
                                    controller: _senderController,
                                  )
                                : Text(
                                    args[0],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SenderSearch.id);
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: blueLightColor),
                            child: FaIcon(
                              FontAwesomeIcons.circleInfo,
                              size: 24.sp,
                              color: seconderyColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: 9.w,
                            ),
                            child: Icon(
                              Icons.phone_android,
                              color: Color(0xff707070),
                            ),
                          ),
                          Expanded(
                            child: args == null
                                ? CustomTextFiled(
                                    hintText: 'mobile ',
                                    controller: _mobileController,
                                  )
                                : Text('+1 0599 1258867',
                                    style: TextStyle(fontSize: 16.sp)),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CategoryScreen.id);
                        },
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.black),
                        child: Row(
                          children: [
                            Text(
                              'Category',
                              style: GoogleFonts.poppins(
                                fontSize: 18.0.sp,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'others',
                              style: GoogleFonts.poppins(
                                  fontSize: 14.0.sp, color: subTitleColor),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            FaIcon(
                              FontAwesomeIcons.angleRight,
                              size: 12,
                              color: subTitleColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: inboxDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFiled(
                        hintText: 'Title of mail',
                        controller: _subjectController,
                        isBold: FontWeight.bold,
                        fontSize: 20,
                      ),
                      CustomTextFiled(
                        hintText: 'Description',
                        borderWidth: 0,
                        controller: _descriptionController,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: inboxDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.black),
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 9.w,
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.calendar,
                                size: 22,
                                color: redCatColor,
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
                                Text('$date',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.0.sp,
                                      color: seconderyColor,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: .3,
                        color: subTitleColor,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: 9.w,
                            ),
                            child: FaIcon(
                              FontAwesomeIcons.fileZipper,
                              size: 22,
                              color: Color(0xff6F7CA7),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Archive',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.0.sp,
                                  ),
                                ),
                                CustomTextFiled(
                                    hintText: 'like 2022/6019',
                                    controller: _archiveController)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: inboxDecoration,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '#',
                            style: GoogleFonts.poppins(
                                color: Color(0xff707070),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, TagScreen.id);
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Text(
                              'Tags ',
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, TagScreen.id);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 14.sp,
                            color: subTitleColor,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, StatusScreen.id);
                },
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, StatusScreen.id);
                  },
                  child: Container(
                    height: 56.h,
                    decoration: inboxDecoration,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.tag,
                                size: 24.sp,
                                color: const Color(0xff707070),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              CategoryContainer(
                                text: 'inbox',
                                color: redCatColor,
                                fontColor: Colors.white,
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 14.sp,
                                color: subTitleColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: inboxDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Decision',
                        style: GoogleFonts.poppins(
                            fontSize: 18.0.sp, fontWeight: FontWeight.w600),
                      ),
                      CustomTextFiled(
                        hintText: 'Add Decision…',
                        controller: TextEditingController(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                    },
                    style:
                        TextButton.styleFrom(foregroundColor: blueLightColor),
                    child: Container(
                      decoration: inboxDecoration,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Add Image',
                          style: GoogleFonts.poppins(
                            color: seconderyColor,
                            fontSize: 16.0.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Visibility(child: Image)
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    initiallyExpanded: true,
                    onExpansionChanged: (bool expanding) =>
                        setState(() => isExpanded2 = expanding),
                    title: Text(
                      'Activity',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: FaIcon(
                      isExpanded2
                          ? FontAwesomeIcons.angleUp
                          : FontAwesomeIcons.angleDown,
                      size: 16,
                      color: isExpanded2 ? seconderyColor : subTitleColor,
                    ),
                    children: activity),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffEEEEF6),
                    hintText: 'Add new Activity …',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      color: const Color(0xffAFAFAF),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20.h,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            ActivityContainer(
                              content: controller.text.toString(),
                            );
                            activity.add(ActivityContainer(
                              content: controller.text.toString(),
                            ));
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.paperPlane,
                          color: primaryColor,
                        )),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 9.w, left: 16.w),
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundImage: AssetImage(
                          'images/user.jpg',
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(50.r)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime? selectedDate;

    // Show the date picker dialog and wait for user selection
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor, // Head background color
            colorScheme:
                ColorScheme.light(primary: primaryColor), // Active day color
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    ).then((selectedDateTime) {
      if (selectedDateTime != null) {
        setState(() {
          DateFormat formatter = DateFormat('EEEE, MMMM d, y');

          String formattedDate = formatter.format(selectedDateTime);
          date = formatter.parse(formattedDate);
        });
      }
    });

    print('selectedDate : $date');
    return date;
  }

  Future<void> pickImage(ImageSource source) async {
    XFile? pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        xFile = pickedImage;
        // (_imagePicker != null ? File(pickedFile.path) : null)!;
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
    print('select image to upload');
    return false;
  }

  Future<void> _showImageSourceDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select an image source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery);
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> uploadImage() async {
    // int processResponse = await updateProfile(xFile!, _nameController.text);

    // if (processResponse == 200) {
    //   print('success');
    //   Navigator.pop(context);
    // } else {
    //   print('failed');
    // }
  }
}
