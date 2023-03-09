import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pal_mail_project/model/api_response.dart';

import '../../model/sender.dart';
import '../../utils/prefs.dart';
import '../api_setting.dart';

class SenderApiController {
  // create sender
  static Future<ApiResponse> createSender(Sender sender) async {
    ApiResponse apiResponse = ApiResponse();
    final http.Response response =
        await http.post(Uri.parse(sendersURL), headers: {
      "Accept": "application/json"
    }, body: {
      "subject": sender.id,
      "description": sender.name,
      "sender_id": sender.mobile,
      "archive_number": sender.address,
      "archive_date": sender.category_id,
      "decision": sender.cretaed_at,
      "update_at": sender.update_at,
      "category": sender.category,
    });
    apiResponse.data = Sender.fromJson(jsonDecode(response.body));
    return apiResponse;
  }

  // get All Sender
  static Future<List<Sender>> getAllSender() async {
    //business logic to send data to server
    print('token :: ${SharedPrefController().getValueFor('token')}');
    String token = '465|9qurxAqXisIuRCtbGpQdjIsRpzzuDW6pDRpb9f1g';
    List<Sender> senderList = [];
    final http.Response response = await http.get(
        Uri.parse(
          mailsURL,
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Sender mails = Sender.fromJson(json);
      print('mail== $mails');

      senderList.add(mails);
      return senderList;
    } else {
      //print('Error');
      throw Exception("Can't load mail ");
    }
  }

  // get Single sender
  static getSingleSender() {}

  // update Sender

  // delete Sender
}
