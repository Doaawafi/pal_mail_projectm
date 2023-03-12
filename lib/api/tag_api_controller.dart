import 'dart:convert';
import 'dart:io';
import '../model/tag.dart';
import '../utils/prefs.dart';
import 'api_setting.dart';
import 'package:http/http.dart' as http;

class TagsApiController{

  Future<List<Tag>> fetchTags() async {
    String token = SharedPrefController().getValueFor('token');
    final response = await http.get(Uri.parse(tagsURL), headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        'Content-Type': 'application/json; charset=UTF-8',
      },);
    // final data = json.decode(response.body)['tags'];
    if(response.statusCode ==200){
      var jsonResponse =json.decode(response.body);
      var tagsJasonArray =jsonResponse['tags'] as List;
      return tagsJasonArray.map((jsonMap) => Tag.fromJson(jsonMap)).toList();
    }
    return [];

  }

}