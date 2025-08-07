part of 'form_consumer.dart';

enum _FormSubmitButtonType { filled, outlined, tonal, text }

class FormSubmitButton extends StatelessWidget {
  const FormSubmitButton.filled({
    super.key,
    this.enabled,
    this.expanded,
    this.label,
    this.extra,
  }) : _type = _FormSubmitButtonType.filled;

  const FormSubmitButton.outlined({
    super.key,
    this.enabled,
    this.expanded,
    this.label,
    this.extra,
  }) : _type = _FormSubmitButtonType.outlined;

  const FormSubmitButton.tonal({
    super.key,
    this.enabled,
    this.expanded,
    this.label,
    this.extra,
  }) : _type = _FormSubmitButtonType.tonal;

  const FormSubmitButton.text({
    super.key,
    this.enabled,
    this.expanded,
    this.label,
    this.extra,
  }) : _type = _FormSubmitButtonType.text;

  final _FormSubmitButtonType _type;
  final bool? enabled;
  final bool? expanded;
  final String? label;
  final Json? extra;

  @override
  Widget build(BuildContext context) {
    final controller = FormConsumer.of(context);

    final enabled = this.enabled ?? true;

    void onPressed() {
      final valid = controller.state?.saveAndValidate();
      if (valid == false) {
        return;
      }
      controller.request(body: {
        ...?controller.state?.value,
        ...?extra,
      });
    }

    late final loadingColor = switch (_type) {
      _FormSubmitButtonType.filled => context.colorScheme.onPrimary,
      _FormSubmitButtonType.outlined => context.colorScheme.primary,
      _FormSubmitButtonType.tonal => context.colorScheme.onPrimary,
      _FormSubmitButtonType.text => context.colorScheme.primary,
    };
    final buttonChild = controller.isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: loadingColor,
              strokeWidth: 2,
            ),
          )
        : Text(label ?? context.helperL10n.confirm);

    final button = switch (_type) {
      _FormSubmitButtonType.filled => FilledButton(
          onPressed: enabled ? onPressed : null,
          child: buttonChild,
        ),
      _FormSubmitButtonType.outlined => OutlinedButton(
          onPressed: enabled ? onPressed : null,
          child: buttonChild,
        ),
      _FormSubmitButtonType.tonal => FilledButton.tonal(
          onPressed: enabled ? onPressed : null,
          child: buttonChild,
        ),
      _FormSubmitButtonType.text => TextButton(
          onPressed: enabled ? onPressed : null,
          child: buttonChild,
        ),
    };

    return ConditionalWrapper(
      condition: expanded ?? true,
      wrapper: (child) => SizedBox(width: double.infinity, child: child),
      child: button,
    );
  }
}
