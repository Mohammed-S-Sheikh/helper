import 'dart:async';
import 'initializer_service.dart';

final class InitializerServiceImpl implements InitializerService {
  const InitializerServiceImpl(
    this.callback, {
    required this.debugName,
    this.onClose,
  });

  static final Set<String> _initializedServices = {};

  @override
  final String debugName;
  final InitializerServiceCallback callback;
  final InitializerServiceCallback? onClose;

  @override
  Future<void> init() async {
    if (_initializedServices.contains(debugName)) {
      return;
    }
    _initializedServices.add(debugName);
    await callback();
  }

  @override
  Future<void>? close() => onClose?.call();

  @override
  String toString() {
    return 'Initializer($debugName)';
  }
}
