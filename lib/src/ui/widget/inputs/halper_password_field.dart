import 'package:flutter/material.dart';
import 'package:helper/src/ui/context_extension.dart';
import 'package:helper/src/ui/widget/inputs/helper_form_field.dart';

class HelperPasswordField extends StatefulWidget {
  const HelperPasswordField({
    super.key,
    required this.name,
    required this.label,
    this.onForgotPassword,
  });

  final String name;
  final String label;
  final VoidCallback? onForgotPassword;

  @override
  State<HelperPasswordField> createState() => _HelperPasswordFieldState();
}

class _HelperPasswordFieldState extends State<HelperPasswordField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    late final forgotPasswordButton = TextButton(
      style: ButtonStyle(
        visualDensity: VisualDensity(vertical: -4),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: widget.onForgotPassword,
      child: Text(context.helperL10n.forgotPassword),
    );

    return HelperFormField(
      name: widget.name,
      labelText: widget.label,
      counter: widget.onForgotPassword != null ? forgotPasswordButton : null,
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
