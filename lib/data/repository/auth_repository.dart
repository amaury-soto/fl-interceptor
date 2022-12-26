import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
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

    final params = {
      "UserPoolId": "us-west-2_2kHZ6pa6",
      "ClientId": "6iin2in42a4qe8fsmjo9ge4t5s",
      "AuthFlow": "USER_PASSWORD_AUTH",
      "AuthParameters": {"USERNAME": usuario, "PASSWORD": contrasena}
    };
    try {
      final response =
          await dio.post('https://cognito-idp.us-west-2.amazonaws.com/',
              options: Options(headers: {
                AWSHeaders.target:
                    'AWSCognitoIdentityProviderService.InitiateAuth',
                AWSHeaders.contentType: 'application/x-amz-json-1.1',
              }),
              data: jsonEncode(params));

      //print(response);
      final userResponse = await jsonDecode(response.data);
      //print('userResponse::::: $userResponse');
      TokenStorage()
          .setToken(userResponse['AuthenticationResult']['AccessToken']);

      //print('response.statusCode!!! ${response.statusCode}');
      if (userResponse.hashCode == false) {
        print('HERE PLEASE');
        throw Exception('Failed SIGN IN BABY :(( ');
      }

      completer.complete(userResponse['AuthenticationResult']);
    } catch (e) {
      if (e is DioError) {
        throw Exception('${e.error}');
      }
      throw Exception(e);
    }
    return completer.future;
  }
}
