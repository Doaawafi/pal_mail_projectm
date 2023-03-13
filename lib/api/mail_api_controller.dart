import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pal_mail_project/model/api_response.dart';
import 'package:pal_mail_project/model/mail.dart';
import '../../utils/prefs.dart';
import 'api_setting.dart';

class MailApiController {
  // create Mail <<DONE >>>
  static Future<void> createMail(Mail mail) async {
    ApiResponse apiResponse = ApiResponse();
    final http.Response response =
        await http.post(Uri.parse(mailsURL), headers: {
      "Accept": "application/json",
      // 'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${SharedPrefController().getValueFor('token')}',
    }, body: {
      "subject": mail.subject,
      "description": mail.description,
      // "sender_id": mail.senderId,
      "archive_number": mail.archiveNumber,
      "archive_date": mail.archiveDate,
      "decision": mail.decision,
      'status_id': mail.statusId,
      'final_decision': mail.finalDecision,
      'tags': jsonEncode([2, 3]),
      'activities': jsonEncode([
        {
          "body": "${mail.activities}",
          "user_id": SharedPrefController().getValueFor('id')
        }
      ]),
    }

            // body: {
            //   'subject': 'any subject 3',
            //   'description': '',
            //   'sender_id': '50',
            //   'archive_number': 'a/20022',
            //   'archive_date': DateTime.now().toString(),
            //   'decision': '',
            //   'status_id': '1',
            //   'final_decision': '',
            //   'tags': jsonEncode([2, 3]),
            //   // 'activities': jsonEncode([
            //   //   {"body": "any text", "user_id": 239}
            //   // ]),
            // },
            );
    print('StatusCode ==== ${response.statusCode}');
    print('response.body === ${response.body}');

    if (response.statusCode == 200) {
      print('response.body === ${response.body}');
      //you can use the return value as below
      Map<String, dynamic> data = jsonDecode(response.body);
      print(' data[mail]::::: ${data['mail']}');
    } else {
      //print('Error');
      throw Exception("Can't load mail");
    }
  }

//   Future<int> uploadImage(File file, mailId) async {
//     String token = await SharedPrefController().getValueFor('token');
//     var request = http.MultipartRequest("POST", Uri.parse(attachmentsURL));
// //create multipart using filepath, string or bytes
//     var pic = await http.MultipartFile.fromPath('image', file.path);
//     request.fields['mail_id'] = mailId.toString();
//     request.fields['title'] = 'image_${DateTime.now()}';
// //add multipart to request
//     request.files.add(pic);
//     request.headers.addAll(
//         {'Accept': 'application/json', 'Authorization': 'Bearer $token'});
//     var response = await request.send();
//
// //Get the response from the server
//     var responseData = await response.stream.toBytes();
//     var responseString = String.fromCharCodes(responseData);
//     print(responseString);
//     return response.statusCode;
//   }

  // get All Mail
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
