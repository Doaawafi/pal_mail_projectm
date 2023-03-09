import 'dart:convert';
import 'package:pal_mail_project/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:pal_mail_project/model/status.dart';
import '../../utils/prefs.dart';
import '../api_setting.dart';

class StatusApiController {
  // static Future<List<Statuses>> getAllStatus({required bool mail}) async {
  //   //business logic to send data to server
  //   print('token :: ${SharedPrefController().getValueFor('token')}');
  //   String token = '465|9qurxAqXisIuRCtbGpQdjIsRpzzuDW6pDRpb9f1g';
  //   List<Statuses> statusesList = [];
  //   final http.Response response = await http.get(
  //       Uri.parse(
  //         mailsURL,
  //       ),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $token',
  //       });
  //
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> json = jsonDecode(response.body);
  //     Statuses statuses = Statuses.fromJson(json);
  //     print('mail== $statuses');
  //
  //     statusesList.add(statuses);
  //     return statusesList;
  //   } else {
  //     //print('Error');
  //     throw Exception("Can't load statuses");
  //   }
  // }

  // Future<ApiResponse> GetSingleStatus(
  //     {required bool mail, required int num}) async {
  //   ApiResponse apiResponse = ApiResponse();
  //   http.Response response = await http.get(
  //     Uri.parse("${statusesURL}/${num}?mail=${mail}"),
  //     headers: {"Accept": "application/json"},
  //   );
  //   apiResponse.data = Statuses.fromJson(jsonDecode(response.body));
  //   return apiResponse;
  // }

  // get single Status
}
