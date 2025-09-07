import 'dart:async';

import 'package:helper/src/logic/data/local/prefs.dart';
import 'package:helper/src/logic/data/network/api.dart';
import 'package:helper/src/logic/initializers/initializer.dart';
import 'package:helper/src/logic/initializers/initializer_service.dart';

final class HelperInitializer with InitializerService {
  const HelperInitializer({
    required this.baseUrl,
    required this.on401,
    this.extraHeaders,
  });

  final String baseUrl;
  final void Function() on401;
  final Map<String, dynamic> Function()? extraHeaders;

  @override
  String get debugName => 'HelperInitializer';

  @override
  FutureOr<void> init() async {
    final initializer = Initializer(
      initializers: [
        const HelperPrefsInitializer(),
        HelperApiInitializer(
          baseUrl: baseUrl,
          on401: on401,
          extraHeaders: extraHeaders,
        ),
      ],
      debugName: 'critical-int',
    );
    await initializer.init();
  }
}

final class HelperPrefsInitializer with InitializerService {
  const HelperPrefsInitializer();

  @override
  String get debugName => 'HelperPrefsInitializer';

  @override
  FutureOr<void> init() async {
    await HelperPrefs.initialize();
  }
}

final class HelperApiInitializer with InitializerService {
  const HelperApiInitializer({
    required this.baseUrl,
    required this.on401,
    this.extraHeaders,
  });

  final String baseUrl;
  final void Function() on401;
  final Map<String, dynamic> Function()? extraHeaders;

  @override
  String get debugName => 'HelperApiInitializer';

  @override
  FutureOr<void> init() async {
    Api.initialize(
      baseUrl: '$baseUrl/',
      extraHeaders: extraHeaders,
      on401: () {
        HelperPrefs.token = null;
        on401();
      },
    );
  }
}
