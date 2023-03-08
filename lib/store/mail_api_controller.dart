import 'dart:convert';

import 'package:http/http.dart'as http;

import 'package:pal_mail_project/api/api_setting.dart';
import 'package:pal_mail_project/model/api_response.dart';
import 'package:pal_mail_project/model/mail.dart';
class MailApiService {
Future<ApiResponse> createMail({required Mail mail})async{
  ApiResponse apiResponse = ApiResponse();
   final http.Response response = await http.post(Uri.parse('$ApiSettings.mailsURL'),
       headers: {
          "Accept": "application/json"
       },
   body:  {
   "subject": mail.subject,
   "description":mail.description ,
   "sender_id": mail.sender_id,
   "archive_number":mail.archive_number,
   "archive_date":mail.archive_date,
   "decision":mail.decision,
   "status_id":mail.status_id,
   "final_decision":mail.final_decision,
   "tags":mail.tage,
   "activities":mail.activites
     //   "activities":jsonEncode({},{});
     //   "tags":mail.tage,
   });
   apiResponse.data=Mail.fromJson(jsonDecode(response.body));
   return  apiResponse;
}

Future<ApiResponse> GetAllMAil()async{
 ApiResponse apiResponse = ApiResponse();
 final http.Response response = await http.get(Uri.parse('${ApiSettings.mailsURL}'),
     headers: {
      "Accept": "application/json"},
     );
 apiResponse.data=Mail.fromJson(jsonDecode(response.body));
 return  apiResponse;

}

}