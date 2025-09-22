import 'package:dio/dio.dart';
import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/logic/data/network/network.dart';
import 'package:helper/src/ui/notifiers/notifiers.dart';
import 'package:jserializer/jserializer.dart';

class FeedbackInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data;
    _handleFeedback(data);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final data = err.response?.data;
    _handleFeedback(data);

    super.onError(err, handler);
  }

  void _handleFeedback(Object? data) {
    if (data is Json && data['feedback'] != null) {
      try {
        final feedback = JSerializer.fromJson<FeedbackModel>(data['feedback']);
        FeedbackNotifier.i.setFeedback(feedback);
      } catch (_) {}
    }
  }
}
