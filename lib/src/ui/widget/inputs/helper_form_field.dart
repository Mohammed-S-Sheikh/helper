import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:helper/src/ui/consumer/form_consumer.dart';
import 'package:helper/src/ui/context_extension.dart';

class HelperFormField extends StatelessWidget {
  const HelperFormField({
    super.key,
    required this.name,
    this.initialValue,
    this.labelText,
    this.enabled = true,
    this.readOnly = false,
    this.isRequired = true,
    this.validator,
    this.showFirstErrorOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.counter,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.visualDensity,
  });

  final String name;
  final String? initialValue;
  final String? labelText;
  final bool enabled;
  final bool readOnly;
  final bool isRequired;
  final String? Function(String?)? validator;
  final bool showFirstErrorOnly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;

  // Input decoration fields
  final Widget? counter;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final VisualDensity? visualDensity;

  @override
  Widget build(BuildContext context) {
    final controller = FormConsumer.of(context);

    final errors = controller.getValidationErrorOf(name) ?? [];

    late final disabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: context.colorScheme.outlineVariant),
      borderRadius: BorderRadius.circular(12),
    );

    return FormBuilderTextField(
      name: name,
      readOnly: readOnly,
      initialValue: initialValue,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        counter: counter,
        labelText: labelText,
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        suffix: suffix,
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        visualDensity: visualDensity,
        border: !enabled || readOnly ? disabledBorder : null,
        disabledBorder: !enabled || readOnly ? disabledBorder : null,
        enabledBorder: !enabled || readOnly ? disabledBorder : null,
        errorBorder: !enabled || readOnly ? disabledBorder : null,
        focusedBorder: !enabled || readOnly ? disabledBorder : null,
        focusedErrorBorder: !enabled || readOnly ? disabledBorder : null,
        error: errors.isEmpty
            ? null
            : showFirstErrorOnly
                ? Text(
                    errors.first,
                    style: TextStyle(color: context.colorScheme.error),
                  )
                : Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final error in errors)
                        Text(
                          error,
                          style: TextStyle(color: context.colorScheme.error),
                        ),
                    ],
                  ),
      ),
      validator:
          validator ?? (isRequired ? FormBuilderValidators.required() : null),
      obscureText: obscureText,
    );
  }
}
