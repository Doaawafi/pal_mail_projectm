// import 'dart:convert';
//
// import 'package:pal_mail_project/api/api_setting.dart';
// import 'package:pal_mail_project/model/api_response.dart';
// import 'package:http/http.dart' as http;
// import 'package:pal_mail_project/model/status.dart';
//
// class StatusApiController {
//   Future<ApiResponse> GetAllStatus({required bool mail}) async {
//     ApiResponse apiResponse = ApiResponse();
//     http.Response response = await http.get(
//       Uri.parse("${ApiSettings.statusesURL}?mail=${mail}"),
//       headers: {"Accept": "application/json"},
//     );
//     apiResponse.data = Statuses.fromJson(jsonDecode(response.body));
//     return apiResponse;
//   }
//
//   Future<ApiResponse> GetSingleStatus(
//       {required bool mail, required int num}) async {
//     ApiResponse apiResponse = ApiResponse();
//     http.Response response = await http.get(
//       Uri.parse("${ApiSettings.statusesURL}/${num}?mail=${mail}"),
//       headers: {"Accept": "application/json"},
//     );
//     apiResponse.data = Statuses.fromJson(jsonDecode(response.body));
//     return apiResponse;
//   }
// }
