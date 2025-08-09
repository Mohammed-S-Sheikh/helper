import 'dart:ui' show Locale;

import 'package:dio/dio.dart';
import 'package:helper/src/logic/data/local/local.dart';

class HeadersInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = HelperPrefs.token;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    final languageCode = HelperPrefs.i.getString('languageCode') ?? 'ar';
    options.headers['Accept-Language'] = Locale(languageCode).languageCode;

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    super.onRequest(options, handler);
  }
}
