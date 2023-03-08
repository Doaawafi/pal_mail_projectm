import 'dart:convert';

import 'package:pal_mail_project/api/api_setting.dart';
import 'package:pal_mail_project/model/api_response.dart';
import 'package:http/http.dart'as http;
import 'package:pal_mail_project/model/role.dart';
class RoleApiController {
  Future<ApiResponse> GetAllRole({required bool mail}) async {
    ApiResponse apiResponse = ApiResponse();
    http.Response response = await http.get(
      Uri.parse("${ApiSettings.rolesURL}"),
      headers: {"Accept": "application/json"},
    );
    apiResponse.data=Role.fromJson(jsonDecode(response.body));
    return apiResponse;
  }
}