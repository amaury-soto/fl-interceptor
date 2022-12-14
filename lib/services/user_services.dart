import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interceptor/network/dio_client.dart';

class UserServices {
  var dio = DioClient().dio;
  void login(values, context) async {
    print(values);
    final Map<String, String> user = {
      "usuario": values['user'],
      "contrasena": values['password']
    };
    try {
      var response = await dio.post(
          'https://lp-01-back.azurewebsites.net/api/v1/Autenticacion/login',
          data: user);
      print(response.data['datos']['token']);
      if (response.data['estado'] == true) {
        Navigator.pushNamed(context, 'register');
      }
    } catch (e) {
      print(e);
    }
  }

  void register(values, context) async {
    final Map<String, String> user = {
      "user": values['user'],
      "email": values['email'],
      "contrasena": values['password']
    };
    print('user $user');
    print('values $values');
    try {
      var response = await dio.post(
          'https://lp-01-back.azurewebsites.net/api/v1/Autenticacion/crear',
          data: user);
      print('response-register::: $response');
    } catch (e) {
      print('e: $e');
    }
  }
}
