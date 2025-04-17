import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:helper/src/app/runner.dart';
import 'package:helper/src/app/wrapper.dart';
import 'package:helper/src/ui/form/form.dart';
import 'package:helper/src/ui/theme_selector.dart';
import 'package:helper/src/ui/ui.dart';

void main() => appRunner(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      home: const FormScreen(),
    );
  }
}

class FormScreen extends StatelessWidget {
  const FormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [LanguageSelector(), ThemeSelector()],
      ),
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
