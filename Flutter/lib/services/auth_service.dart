import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/UserDetail.dart';
import 'package:shop_app/utils/constants.dart';

class AuthService extends GetxService {
  UserDetail? _userDetail;

  UserDetail? get userDetail => _userDetail;

  Future<AuthService> init() async {
    await getCurrentUser();
    return this;
  }

  Future<void> getCurrentUser() async {
    int? id = getIntFromBox(kCurrentUserId);
    if (id != null) {
      try {
        print(getUrl(['auth', 'user']));
        var response = await http
            .post(getUrl(['auth', 'user']), body: {'custId': id.toString()});
        if (response.statusCode == 200) {
          var d = jsonDecode(jsonDecode(response.body));
          if (d['exists']) {
            _userDetail = UserDetail.fromJson(d['data']);
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      print(_userDetail.toString());
    }
  }

  Future<Map> login(String email, String password) async {
    try {
      print(getUrl(['auth', 'login']));
      var response = await http.post(getUrl(['auth', 'login']),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var d = jsonDecode(jsonDecode(response.body));
        return Future.value(d);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return Future.value({});
  }

  Future<Map> signUp(UserDetail userDetail, String password) async {
    try {
      print(getUrl(['auth', 'signup']));
      var m = userDetail.toMap();
      m.putIfAbsent('password', () => password);
      var response = await http.post(getUrl(['auth', 'signup']), body: m);
      print(response.statusCode.toString());
      print(response.body.toString());

      if (response.statusCode == 200) {
        var d = jsonDecode(jsonDecode(response.body));
        return Future.value(d);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return Future.value({'status': false});
  }
}
