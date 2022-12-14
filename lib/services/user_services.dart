import 'package:flutter_interceptor/network/dio_client.dart';

class UserServices {
  void login(values) async {
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
    } catch (e) {
      print(e);
    }
  }
}
