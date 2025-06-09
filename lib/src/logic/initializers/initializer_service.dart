import 'dart:async';
import 'initializer_service_impl.dart';

typedef InitializerServiceCallback = Future<void> Function();

abstract mixin class InitializerService {
  const factory InitializerService(
    InitializerServiceCallback callback, {
    required String debugName,
    InitializerServiceCallback? onClose,
  }) = InitializerServiceImpl;

  FutureOr<void> init();

  FutureOr<void> close() {}

  String get debugName;
}
