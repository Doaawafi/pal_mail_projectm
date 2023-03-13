import 'dart:convert';
import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_mail_project/api/api_setting.dart';
import 'package:pal_mail_project/api/tag_api_controller.dart';
import 'package:pal_mail_project/widget/custom_header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/tag.dart';
import '../utils/constant.dart';
import 'package:http/http.dart' as http;
import '../widget/tag_container.dart';
import 'new_inbox.dart';

class TagScreen extends StatefulWidget {
  static const String id = 'TagScreen';
  const TagScreen({Key? key}) : super(key: key);

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  late TextEditingController _tagsController ;
  final List _tag = [];

  Future<bool> createTags(String name) async {
    final prefs = await SharedPreferences.getInstance();
    String token = '';
    if (prefs.getString('token') != null) {
      token = prefs.getString('token')!;  }

    var url = Uri.parse(tagsURL);
    var response = await http.post(url, headers: {HttpHeaders.authorizationHeader: token},
        body: {
      'name':name
    });
      if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var tagsJasonArray =jsonResponse['tags'];
      print('Name added successfully');
      return true;
    }
    else {
      print('Failed to add name');
      return false;  }
  }

  @override
  void initState() {
     super.initState();
     _tagsController=TextEditingController();

  }
  
  @override
  void dispose()  {
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: ()=>Navigator.pushNamed(context, NewInbox.id),
                  child:  CustomHeader(title: 'Tags', onPressed: () {  },)),
              SizedBox(height: 50.h,),
              AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Tags',
                        textStyle:const  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30

                    )),
                  ],
                  isRepeatingAnimation: false,


                ),
              SizedBox(height: 10.h,),
              FutureBuilder<List<Tag>>(
                  future: TagsApiController().fetchTags(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if (snapshot.hasData && snapshot.data!.isNotEmpty){
                       return Flexible(
                         child: Container(
                           decoration: inboxDecoration,
                           child: GridView.builder(
                             gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                 childAspectRatio: 2.2,
                                 crossAxisCount: 3,
                                 mainAxisSpacing: 5.h,
                                 crossAxisSpacing: 10.w
                             ),
                             shrinkWrap: true,
                                   itemCount:snapshot.data!.length,
                                   itemBuilder: (context, index) {
                                     return Padding(
                                       padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                       child: TagContainer(
                                         text: snapshot.data![index].name,
                                       ),
                                     );
                                   },
                           ),
                         ),
                       );
                    }
                    else{
                      return const  Center(child: Text("No Tags To Display"));
                    }
                  }
                  ),
              SizedBox(height: 20.h,),
              SizedBox(height: 50.h,),
              Flexible(
                child: TextField(
                controller:_tagsController ,
                keyboardType: TextInputType.text,
                style:GoogleFonts.poppins() ,
                maxLength:15 ,
                onSubmitted: (String value)=>_performSave() ,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hoverColor: const Color(0xFFFFC4C4),
                  counterText: "",
                  labelText: "Enter Tags",
                  labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon:  const Icon(Icons.tag),
                  // contentPadding: EdgeInsets.zero,
                  suffixIcon: IconButton(
                      onPressed: () {
                        createTags(_tagsController.text).then((value) {
                          _performSave();
                          _tagsController.clear();
                          setState(() {}
                          );
                        });
                      },
                  icon: const Icon(Icons.save),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                    gapPadding: 0,
                    borderSide: const BorderSide(color: Colors.black45)
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius:BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue.shade400)
                  ),


                ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  void  _performSave(){
    if(_checkData()){
      _save();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  height:80,
                  decoration:  BoxDecoration(
                      color: const Color(0xFFFF577F),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 48.w,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("YAHH!!!",style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                            AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'tag created successfully ',
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
                            // Text("tag created successfully ",style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),

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
                        Image.asset("images/close.png",height: 40,width: 50,color:const Color(0xFFFF577F),),
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


          ));
    }
  }
  bool  _checkData(){
    if(_tagsController.text.isNotEmpty){
      return true;
    }
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
                                'Please, Enter tags to add...',
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
  void _save(){
    setState(()=>_tag.add(_tagsController.text));
    _tagsController.clear();
  }

}
