import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_interceptor/data/endpoints/enpoints.dart';
import 'package:flutter_interceptor/network/dio_client.dart';
import 'package:flutter_interceptor/storage/token_storage.dart';
import 'package:get_it/get_it.dart';

class AuthRepository {
  //final netWorkLocator = GetIt.get<DioClient>();
  var dio = DioClient().dio;
/*   Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? userName,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response =
          dio.post('${EndPoints.baseUrl}${EndPoints.register}', data: {
        'email': email,
        'password': password,
        'username': userName,
      });
      if (response.statusCode != 200) {
        throw Exception('Failed to sign up');
      }
      completer.complete(response.data);
    } catch (e) {
      print(e);
    }
    return completer.future;
  } */

  Future<Map<String, dynamic>> logIn(
      {required String? usuario, required String? contrasena}) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await dio.post('${EndPoints.baseUrl}${EndPoints.login}',
          data: {'usuario': usuario, 'contrasena': contrasena});
      TokenStorage().setToken(response.data['datos']['token'].toString());

      print('response repository!!! $response');
      print('OTRA COSAAAAAAA ${response.data['estado'].runtimeType}');

      if (response.statusCode != 200) {
        throw Exception('Failed SIGN IN BABY :(( ');
      }

      completer.complete(response.data);
    } catch (e) {
      print('e::: $e');
    }
    return completer.future;
  }
}
