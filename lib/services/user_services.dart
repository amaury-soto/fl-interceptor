import 'package:flutter/material.dart';
import 'package:flutter_interceptor/network/dio_client.dart';

class UserServices {
  void login(values, context) async {
    print(values);
    final Map<String, String> user = {
      "usuario": values['user'],
      "contrasena": values['password']
    };
    try {
      var dio = DioClient().dio;

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
}
