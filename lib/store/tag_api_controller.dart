import 'dart:convert';

import 'package:pal_mail_project/api/api_setting.dart';
import 'package:pal_mail_project/model/api_response.dart';
import 'package:http/http.dart'as http;
import 'package:pal_mail_project/model/tags.dart';
class TagApiController{
  Future<ApiResponse> GetAllTag({required bool mail}) async {
    ApiResponse apiResponse = ApiResponse();
    http.Response response = await http.get(
      Uri.parse("${ApiSettings.tagsURL}"),
      headers: {"Accept": "application/json"},
    );
    apiResponse.data=Tags.fromJson(jsonDecode(response.body));
    return apiResponse;
  }


}