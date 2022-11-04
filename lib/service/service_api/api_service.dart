// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart';

class Service {
  static void login(String email, password) async {
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static void addForm(
    String email,
    String name,
    String noTelp,
    String job,
  ) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/users'), body: {
        'email': email,
        'name': name,
        'noTelp': noTelp,
        'job': job,
      });

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(data['id']);
        print('data successfully create');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
