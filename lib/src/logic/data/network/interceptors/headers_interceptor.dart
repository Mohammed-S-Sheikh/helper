import 'dart:ui' show Locale;

import 'package:dio/dio.dart';
import 'package:helper/src/logic/data/local/local.dart';
import 'package:helper/src/logic/data/network/types.dart';

class HeadersInterceptor extends Interceptor {
  const HeadersInterceptor(this.extraHeaders);

  final Json Function()? extraHeaders;

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

    if (extraHeaders != null) {
      options.headers.addAll(extraHeaders!());
    }

    super.onRequest(options, handler);
  }
}
