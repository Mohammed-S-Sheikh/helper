import 'package:dio/dio.dart';

class UnautherizedInterceptor extends Interceptor {
  final void Function() _on401;

  const UnautherizedInterceptor(void Function() on401) : _on401 = on401;

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      _on401();
    }

    super.onError(err, handler);
  }
}
