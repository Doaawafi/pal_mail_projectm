import 'dart:convert';

import 'package:pal_mail_project/api/api_setting.dart';
import 'package:pal_mail_project/model/api_response.dart';
import 'package:http/http.dart'as http;
import 'package:pal_mail_project/model/sender.dart';
class SenderApiController{


  Future<ApiResponse> GetAllSender({required bool mail}) async {
    ApiResponse apiResponse = ApiResponse();
    http.Response response = await http.get(
      Uri.parse("${ApiSettings.sendersURL}?mail=${mail}"),
      headers: {"Accept": "application/json"},
    );
    apiResponse.data=Sender.fromJson(jsonDecode(response.body));
    return apiResponse;
  }

  Future<ApiResponse> createSender({required Sender sender}) async {
    ApiResponse apiResponse = ApiResponse();
    final http.Response response =
    await http.post(Uri.parse(ApiSettings.sendersURL), headers: {
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
  Future<ApiResponse> GetSingleSender({required bool mail,required int num}) async {
    ApiResponse apiResponse = ApiResponse();
    http.Response response = await http.get(
      Uri.parse("${ApiSettings.sendersURL}/${num}?mail=${mail}"),
      headers: {"Accept": "application/json"},
    );
    apiResponse.data=Sender.fromJson(jsonDecode(response.body));
    return apiResponse;
  }

  Future<ApiResponse> PutUpdateSender({required Sender sender}) async {
    ApiResponse apiResponse = ApiResponse();
    http.Response response = await http.put(
      Uri.parse("${ApiSettings.sendersURL}/${sender.id}"),
      headers: {"Accept": "application/json"},
      body: {
        "name":sender.name,
        "mobile":sender.mobile,
        "address":sender.address,
        "category_id":sender.category_id
      }
    );
    apiResponse.data=Sender.fromJson(jsonDecode(response.body));
    return apiResponse;
  }
  Future<ApiResponse> DeldeleteSender({required Sender sender}) async {
    ApiResponse apiResponse = ApiResponse();
    http.Response response = await http.put(
        Uri.parse("${ApiSettings.sendersURL}/${sender.id}"),
        headers: {"Accept": "application/json"},
        body: {
          "name":sender.name,
          "mobile":sender.mobile,
          "address":sender.address,
          "category_id":sender.category_id
        }
    );
    apiResponse.data=Sender.fromJson(jsonDecode(response.body));
    return apiResponse;
  }




}