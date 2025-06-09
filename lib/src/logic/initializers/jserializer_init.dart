import 'package:helper/jserializer.dart';
import 'package:helper/src/logic/initializers/initializer_service.dart';

final class JserializerInit with InitializerService {
  @override
  Future<void> init() async {
    initializeJSerializer();
  }

  @override
  String get debugName => 'JserializerInitializer';
}
