import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pal_mail_project/model/user.dart';
import 'package:pal_mail_project/screens/auth/auth.dart';
import 'package:pal_mail_project/screens/category.dart';
import 'package:pal_mail_project/screens/home/home.dart';
import 'package:pal_mail_project/screens/auth/login.dart';
import 'package:pal_mail_project/screens/new_inbox.dart';
import 'package:pal_mail_project/screens/profile.dart';
import 'package:pal_mail_project/screens/search_screen.dart';
import 'package:pal_mail_project/screens/sender_search.dart';
import 'package:pal_mail_project/screens/serach_filter.dart';
import 'package:pal_mail_project/screens/auth/sign_up.dart';
import 'package:pal_mail_project/screens/splash/splash.dart';
import 'package:pal_mail_project/screens/status.dart';
import 'package:pal_mail_project/screens/tag_screen.dart';
import 'package:pal_mail_project/screens/home/details_screen.dart';
import 'package:pal_mail_project/utils/prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(428, 926),
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: SplachScreen.id,
          routes: {
            SplachScreen.id: (context) => SplachScreen(),
            AuthScreen.id: (context) => AuthScreen(),
            Login.id: (context) => Login(),
            SignUp.id: (context) => SignUp(),
            HomeScreen.id: (context) => HomeScreen(),
            DetailsScreen.id: (context) => DetailsScreen(),
            NewInbox.id: (context) => NewInbox(),
            StatusScreen.id: (context) => StatusScreen(),
            CategoryScreen.id: (context) => CategoryScreen(),
            SearchFilter.id: (context) => SearchFilter(),
            TagScreen.id: (context) => TagScreen(),
            SenderSearch.id: (context) => SenderSearch(),
            SearchScreen.id: (context) => SearchScreen(),
            Profile.id: (context) => Profile(),
          },
        );
      },
    );
  }
}
