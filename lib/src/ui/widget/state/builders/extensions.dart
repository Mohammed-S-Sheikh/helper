part of 'app_state_builders.dart';

extension on Failure {
  Widget get image {
    return switch (this) {
      // TODO(Saaher): Handle cases.
      Failure() => Icon(Icons.cancel_outlined),
    };
  }
}
