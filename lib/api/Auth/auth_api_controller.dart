import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../../model/user.dart';
import '../../utils/prefs.dart';
import '../api_setting.dart';

class AuthApiController {
  Future<bool> login(
      {required BuildContext,
      required String email,
      required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    http.Response response = await http.post(
      uri,
      body: {
        'email': email,
        'password': password,
      },
    );
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body)['token'];
      print(jsonObject);
      // print(jsonObject['token']);
      // var data = jsonDecode(response.body)['user'] as User;
      SharedPrefController().save(user: jsonDecode(response.body)['user']);
      print('yaaaaaaaaa${jsonDecode(response.body)['user']}');
      SharedPrefController().getToken(token: jsonObject);
      // print('${user.token} in api');

      return true;
    } else if (response.statusCode != 500) {
      print('${jsonDecode(response.body)['message']}');
    } else {
      print('something went wrong,please try again ');
    }
    return false;
  }

  Future<bool> register(
      {required BuildContext BuildContext, required User user}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    http.Response response = await http.post(uri, body: {
      'email': user.email,
      'password': user.password,
      'password_confirmation': user.Conpassword,
      'name': user.name,
    });
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('created sucess');

      var jsonObject = jsonDecode(response.body);

      print(jsonObject);
      SharedPrefController().save(user: jsonDecode(response.body)['user']);
      print('yaaaaaaaaa${jsonDecode(response.body)['user']}');
      print("ShareReference done");
      print("${user.email} emaileofjidfbbhefberi");
      return true;
    } else if (response.statusCode != 500) {
      print('${jsonDecode(response.body)['message']}');
      // showSnackBar(
      //     context: context,
      //     message: ,
      //     erorr: true);
      return true;
    } else {
      print('something went wrong,please try again ');
      // showSnackBar(
      //     context: context,
      //     message: 'something went wrong,please try again ',
      //     erorr: true);
    }
    return false;
  }

  Future<bool> logout({required BuildContext BuildContext}) async {
    print('kclmackacmaa');

    String token = SharedPrefController().getValueFor('token');
    Uri uri = Uri.parse(ApiSettings.logout);
    http.Response response = await http.post(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('logout success ');
      SharedPrefController().clear;
      return true;
    } else {
      return false;
    }
  }
}
