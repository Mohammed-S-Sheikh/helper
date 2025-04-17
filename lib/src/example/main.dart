import 'package:flutter/material.dart';
import 'package:helper/src/app/runner.dart';
import 'package:helper/src/app/wrapper.dart';
import 'package:helper/src/example/form_screen.dart';

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
