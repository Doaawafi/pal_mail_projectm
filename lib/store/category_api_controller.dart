// import 'package:http/http.dart' as http;
// import 'package:pal_mail_project/api/api_setting.dart';
// import 'dart:convert';
//
// import 'package:pal_mail_project/model/api_response.dart';
// import 'package:pal_mail_project/model/categories.dart';
// class CategoryApiController{
//
//   Future<ApiResponse> GetAllcatadory()async{
//     ApiResponse apiResponse = ApiResponse();
//     final http.Response response = await http.get(Uri.parse('$categoriesURL'),
//       headers: {
//         "Accept": "application/json"},
//     );
//     apiResponse.data=Categories.fromJson(jsonDecode(response.body));
//     return  apiResponse;
//
//   }
//
//   Future<ApiResponse> GetSingleCategory({required int num}) async {
//     ApiResponse apiResponse = ApiResponse();
//     http.Response response = await http.get(
//       Uri.parse("${categoriesURL}/${num}"),
//       headers: {"Accept": "application/json"},
//     );
//     apiResponse.data=Categories.fromJson(jsonDecode(response.body));
//     return apiResponse;
//   }
//
//   Future<ApiResponse> CreateCatagory ({required String name})async{
//     ApiResponse apiResponse = ApiResponse();
//     final http.Response response =
//     await http.post(Uri.parse("${categoriesURL}"), headers: {
//       "Accept": "application/json"
//     }, body: {
//       "name": name,
//
//     });
//     apiResponse.data = Categories.fromJson(jsonDecode(response.body));
//     return apiResponse;
//   }
// }
