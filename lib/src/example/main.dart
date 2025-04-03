import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:helper/src/app/app.dart';
import 'package:helper/src/data/local/local.dart';
import 'package:helper/src/ui/form/form.dart';
import 'package:helper/src/ui/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPrefs.initialize();
  await AppLanguage().loadSavedLanguage();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: AppLanguage().locale,
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) => AppDirectionality(child: child!),
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
      appBar: AppBar(actions: const [LanguageSelector()]),
      body: AppForm(
        submitLabel: 'login',
        onSubmit: (value) {
          print(value);
        },
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
