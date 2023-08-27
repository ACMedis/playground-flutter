import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:playground_app/src/core/restClient/interceptors/auth_interceptor.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(BaseOptions(
          baseUrl: 'http://192.168.1.100:8080',
          // baseUrl: 'http://129.159.57.76:8080',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
        )) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
    ]);
  }

  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unauth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
