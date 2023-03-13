import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pal_mail_project/api/roles_service/roles_api_controller.dart';
import 'package:pal_mail_project/api/sender_service/sender_api_controller.dart';
import 'package:pal_mail_project/utils/constant.dart';
import '../widget/custom_header.dart';
import '../widget/search_box.dart';
import '../widget/search_delegate.dart';

class SenderSearch extends StatefulWidget {
  const SenderSearch({Key? key}) : super(key: key);
  static const String id = "SenderSearch";

  @override
  State<SenderSearch> createState() => _SenderSearchState();
}

class _SenderSearchState extends State<SenderSearch> {
  List<String> _senderNameList = [];

  void readSenderName() async {
    dynamic data = await SenderApiController.getAllSenderName();
    await showSearch(
      context: context,
      delegate: CustomSearchDelegate(senders: data),
    );
    setState(() {
      _senderNameList = data;
    });
  }

  @override
  void initState() {
    readSenderName();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   elevation: 1,
      //   centerTitle: true,
      //   backgroundColor: blueLightColor,
      //   title: Text('sender search'),
      //   iconTheme: IconThemeData(color: primaryColor),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         showSearch(
      //           context: context,
      //           delegate: CustomSearchDelegate(senders: _senderNameList),
      //         );
      //       },
      //       icon: Icon(Icons.search),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
