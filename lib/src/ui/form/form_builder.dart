import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:helper/src/ui/widget/actions/actions.dart';
import 'package:helper/src/ui/widget/communication/communication.dart';

typedef FormSubmitCallback = void Function(Map<String, dynamic> value);

class AppForm extends StatefulWidget {
  const AppForm({
    super.key,
    this.alertUnsavedChanges = false,
    this.padding,
    this.submitIcon,
    required this.submitLabel,
    required this.onSubmit,
    required this.children,
  });

  final bool alertUnsavedChanges;
  final EdgeInsetsGeometry? padding;
  final Widget? submitIcon;
  final String submitLabel;
  final FormSubmitCallback onSubmit;
  final List<Widget> children;

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _loading = false;

  FormBuilderState get _state => _formKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      // enabled: !_loading,
      canPop: !widget.alertUnsavedChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop || !widget.alertUnsavedChanges) return;
        if (!_state.isDirty) return Navigator.of(context).pop();

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('تغييرات غير محفوظة'),
            content: Text(
                'توجد لديك تغييرات غير محفوظة، هل تريد مغادرة هذه الصفحة؟'),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('إلغاء'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('مغادرة'),
              ),
            ],
          ),
        );
      },
      child: SingleChildScrollView(
        padding: widget.padding,
        child: Column(
          children: [
            ...widget.children,
            const SizedBox(height: 24),
            ExpandedButton(
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() => _loading = true);
                      final valid = _state.saveAndValidate();
                      if (valid) {
                        try {
                          widget.onSubmit(_state.value);
                        } catch (e) {
                          if (context.mounted) {
                            context.showSnackBar(e.toString());
                          }
                        }
                      }
                      setState(() => _loading = false);
                    },
              icon: _loading ? null : widget.submitIcon,
              label: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(widget.submitLabel),
            ),
          ],
        ),
      ),
    );
  }
}
