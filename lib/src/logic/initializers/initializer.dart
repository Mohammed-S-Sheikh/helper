import 'package:helper/src/logic/initializers/initializer_iml.dart';
import 'package:helper/src/logic/initializers/initializer_service.dart';

abstract interface class Initializer implements InitializerService {
  factory Initializer({
    required String debugName,
    List<InitializerService>? initializers,
    InitializationPolicy? policy,
  }) = InitializerImpl;

  List<InitializerService> get initializers;

  @override
  Future<void> init();

  @override
  Future<void> close();

  Initializer copyWithAdditionalServices(
    List<InitializerService> initializers,
  );
}

enum InitializationPolicy {
  /// if a service fails for some reason it will
  failFirst,

  /// Services will be executed in order/sequence
  runInSequence,

  /// All services will start the same time.
  runInParallel,
}
