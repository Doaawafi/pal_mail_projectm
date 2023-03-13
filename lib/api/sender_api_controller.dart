import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pal_mail_project/model/api_response.dart';
import '../../model/mail.dart';
import '../../model/sender.dart';
import '../../utils/prefs.dart';
import 'api_setting.dart';
import 'mail_api_controller.dart';

class SenderApiController {
  // create sender
  static Future<void> createSender(
    String senderName,
    String mobile,
    String categoryId,
    String subject,
    String description,
    String archiveNumber,
    DateTime? archiveDate,
    String decision,
    String statusId,
  ) async {
    ApiResponse apiResponse = ApiResponse();
    final http.Response response =
        await http.post(Uri.parse(sendersURL), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer ${SharedPrefController().getValueFor('token')}',
    }, body: {
      "name": senderName,
      "mobile": mobile,
      "address": '',
      "category_id": categoryId,
    });
    if (response.statusCode == 200) {
      print('response.body === ${response.body}');
      //you can use the return value as below
      Map<String, dynamic> data = jsonDecode(response.body);
      print(' data == ${data['sender']}');
      MailApiController.createMail(Mail(
        subject,
        description,
        46,
        archiveNumber,
        archiveDate,
        decision,
        1,
        '',
        jsonEncode([2, 3]),
        jsonEncode([
          {
            "body": "any text",
            "user_id": SharedPrefController().getValueFor('id')
          }
        ]),
      ));
    } else {
      //print('Error');
      throw Exception("Can't load sender");
    }
  }

  static Future<String> getSingleSenderMobile(String sender) async {
    String senderMobile = '';
    final http.Response response = await http.get(
        Uri.parse(
          mailsURL,
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${SharedPrefController().getValueFor('token')}',
        });

    print('Status code : ${response.statusCode}');
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print('response == ${response.body}');
      List<dynamic> sendersName = jsonDecode(response.body)["mails"]["data"];
      for (var sender in sendersName) {
        if (sender["sender"]["name"] == sender)
          String senderName = sender["sender"]["name"];
        String senderMobile = sender["sender"]["mobile"];
        senderMobile = senderMobile;
        // // int senderid= sender["sender"]["id"];
        // senderNameList.add(senderName);
      }
      print('senderNameList == $senderMobile');
      return senderMobile;
    } else {
      print('Error');
      throw Exception("Can't load sender mobile");
    }
  }

  static Future<List<String>> getAllSenderName() async {
    List<String> senderNameList = [];
    final http.Response response = await http.get(
        Uri.parse(
          mailsURL,
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${SharedPrefController().getValueFor('token')}',
        });

    print('Status code : ${response.statusCode}');
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print('response == ${response.body}');
      List<dynamic> sendersName = jsonDecode(response.body)["mails"]["data"];
      for (var sender in sendersName) {
        String senderName = sender["sender"]["name"];
        String senderMobile = sender["sender"]["mobile"];
        senderNameList.add(senderName);
      }
      print('senderNameList == $senderNameList');
      return senderNameList;
    } else {
      print('Error');
      throw Exception("Can't load sender name");
    }
  }

  // get All Sender
  static Future<List<SenderData>> getAllSender() async {
    List<SenderData> senderList = [];
    final http.Response response = await http.get(
        Uri.parse(
          mailsURL,
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer ${SharedPrefController().getValueFor('token')}',
        });

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print('response == ${response.body}');
      SenderData senders = SenderData.fromJson(json);
      String senderName = json["mails"]["data"][0]["sender"]["name"];
      print('SENDER NAME == ${senderName}');
      print('sender == $senders');

      senderList.add(senders);
      return senderList;
    } else {
      //print('Error');
      throw Exception("Can't load sender ");
    }
  }

  // get Single sender
  static getSingleSender() {}

// update Sender

// delete Sender
}
