import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:playground_app/src/core/constants/api_constants.dart';
import 'package:playground_app/src/core/constants/local_storage_keys.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;

    const authReaderKey = 'Authorization';

    headers.remove(authReaderKey);

    if (extra case {'DIO_AUTH_KEY': true}) {
      final sp = await SharedPreferences.getInstance();
      headers.addAll({authReaderKey: 'Bearer $token_api'});
      // final sp = await SharedPreferences.getInstance();
      // headers.addAll({
      //   authReaderKey: 'Bearer ${sp.getString(LocalStorageKeys.acessToken)}'
      // });
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // final DioException(requestOptions: RequestOptions(:extra), :response) = err;

    // if (extra case {'DIO_AUTH_KEY': true}) {
    //   if (response != null && response.statusCode == HttpStatus.forbidden) {
    //     Navigator.of(BarbershopNavGlobalKey.instance.navKey.currentContext!)
    //         .pushNamedAndRemoveUntil('/auth/login', (route) => false);
    //   }
    // }
    handler.reject(err);
  }
}
