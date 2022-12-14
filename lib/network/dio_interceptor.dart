import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //final response = await
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI2MzE3Y2U2MmMzNWNlM2FmZTliZjgyMjEiLCJlbWFpbCI6Im9vbGF5YUBvb2xheWEuY29tLmNvIiwibmJmIjoxNjcwOTY4NTk0LCJleHAiOjE2NzEwNTQ5OTQsImlhdCI6MTY3MDk2ODU5NCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMzAiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjQyMDAifQ.scmugudD23FU1Nh_l47jbGaKjCOsLa1dDvrS2dna64c';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
