import 'dart:convert';
import 'package:pal_mail_project/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:pal_mail_project/model/tags.dart';

import '../../utils/prefs.dart';
import '../api_setting.dart';

class TagApiController {
  // Note : All function should be static

  // get All Tage
  static Future<List<Tags>> getAllTags() async {
    //business logic to send data to server
    print('token :: ${SharedPrefController().getValueFor('token')}');
    String token = SharedPrefController().getValueFor('token');
    List<Tags> tagsList = [];
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
      Tags tags = Tags.fromJson(json);
      print('Tags ==  $tags');

      tagsList.add(tags);
      return tagsList;
    } else {
      //print('Error');
      throw Exception("Can't load Tags ");
    }
  }

  // create Tage

  // get All Tags with Mail

  // get All Tags of Mail
}
