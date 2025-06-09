import 'package:equatable/equatable.dart';
import 'initializer_service.dart';
import 'initializer.dart';

class InitializerImpl with EquatableMixin implements Initializer {
  const InitializerImpl({
    required this.debugName,
    List<InitializerService>? initializers,
    InitializationPolicy? policy,
  })  : initializers = initializers ?? const [],
        policy = policy ?? InitializationPolicy.runInSequence;

  @override
  final List<InitializerService> initializers;

  final InitializationPolicy policy;

  @override
  final String debugName;

  @override
  Future<void> close() async {
    final futures = initializers.toSet().map(
          (service) =>
              service is Initializer ? service.close() : Future<void>.value(),
        );
    await Future.wait(futures);
  }

  InitializerImpl copyWith({
    String? debugName,
    InitializationPolicy? policy,
    List<InitializerService>? initializers,
  }) {
    return InitializerImpl(
      debugName: debugName ?? this.debugName,
      policy: policy ?? this.policy,
      initializers: initializers ?? this.initializers,
    );
  }

  @override
  Initializer copyWithAdditionalServices(
    List<InitializerService> additionalServices,
  ) {
    final combinedServices = List<InitializerService>.from(initializers);
    for (final service in additionalServices) {
      if (!combinedServices.contains(service)) {
        combinedServices.add(service);
      }
    }
    return copyWith(initializers: combinedServices);
  }

  @override
  Future<void> init() async {
    final futures = initializers.map(
      (service) async {
        return await service.init();
      },
    );
    await Future.wait(futures);
  }

  @override
  List<Object?> get props => [initializers, debugName, policy];
}
