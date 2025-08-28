import 'package:flutter/material.dart';
import 'package:helper/src/ui/widget/inputs/helper_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.name,
    required this.label,
  });

  final String name;
  final String label;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return HelperFormField(
      name: widget.name,
      labelText: widget.label,
      suffix: IconButton(
        style: const ButtonStyle(
          visualDensity: VisualDensity(vertical: -4, horizontal: -4),
        ),
        onPressed: () => setState(() => _showPassword = !_showPassword),
        icon: _showPassword
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
      ),
      visualDensity: const VisualDensity(vertical: -3),
      obscureText: !_showPassword,
    );
  }
}
