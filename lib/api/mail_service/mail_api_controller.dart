import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pal_mail_project/model/api_response.dart';
import 'package:pal_mail_project/model/mail.dart';

import '../../utils/prefs.dart';
import '../api_setting.dart';

class MailApiService {
  static Future<Mail> createMail(Mail mail) async {
    ApiResponse apiResponse = ApiResponse();
    final http.Response response =
        await http.post(Uri.parse(mailsURL), headers: {
      "Accept": "application/json"
    }, body: {
      jsonEncode(mail.toJson())
      // "subject": mail.subject,
      // "description": mail.description,
      // "sender_id": mail.senderId,
      // "archive_number": mail.archiveNumber,
      // "archive_date": mail.archiveDate,
      // "decision": mail.decision,
      // "status_id": mail.statusId,
      // "final_decision": mail.finalDecision,
      // "tags": mail.tags,
      // "activities": mail.activities
      //   "activities":jsonEncode({},{});
      //   "tags":mail.tage,
    });
    if (response.statusCode == 200) {
      //print(response.body);
      print(
          'Mail.fromJson(json.decode(response.body))=== ${Mail.fromJson(json.decode(response.body))}');

      return Mail.fromJson(json.decode(response.body));
    } else {
      //print('Error');
      throw Exception("Can't load mail");
    }
    // apiResponse.data = Mail.fromJson(jsonDecode(response.body));
    // return apiResponse;
  }

  static Future<List<Mail>> getAllMails() async {
    //business logic to send data to server
    print('token :: ${SharedPrefController().getValueFor('token')}');
    String token = '465|9qurxAqXisIuRCtbGpQdjIsRpzzuDW6pDRpb9f1g';
    List<Mail> mailList = [];
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
      Mail mails = Mail.fromJson(json);
      print('mail== $mails');

      mailList.add(mails);
      return mailList;
    } else {
      //print('Error');
      throw Exception("Can't load mail ");
    }
  }
}
