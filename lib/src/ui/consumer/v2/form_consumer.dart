import 'package:flutter/material.dart';
import 'package:helper/src/data/network/network.dart';
import 'package:helper/src/ui/form/form.dart';
import 'package:helper/src/ui/widget/communication/communication.dart';

class FormConsumer<T> extends StatelessWidget {
  const FormConsumer({
    super.key,
    required this.apiEntry,
    required this.submitLabel,
    required this.onSuccess,
    required this.children,
  });

  final ApiEntry<T> apiEntry;
  final String submitLabel;
  final ValueChanged<T> onSuccess;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AppFormBuilder(
      submitLabel: submitLabel,
      onSubmit: (value) async {
        final newEntry = apiEntry.copyWith(body: value);
        final response = await ApiRequest.fetchEither<T>(newEntry);
        response.fold(
          (l) => context.showSnackBar(l.message),
          onSuccess,
        );
      },
      children: children,
    );
  }
}
