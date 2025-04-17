import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:helper/src/ui/form/form.dart';
import 'package:helper/src/ui/ui.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [LanguageSelector()]),
      body: AppFormBuilder(
        submitLabel: 'login',
        onSubmit: (value) {},
        children: [
          FormBuilderTextField(
            name: 'text1',
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 12),
          FormBuilderTextField(
            name: 'text2',
          ),
        ],
      ),
    );
  }
}
