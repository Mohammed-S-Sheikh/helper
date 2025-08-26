part of 'app_state_builders.dart';

extension on Failure {
  Widget get image {
    return switch (this) {
      // TODO(Saaher): Handle cases.
      Failure() => const Icon(
          Icons.bug_report_outlined,
          size: 100,
        ),
    };
  }
}
