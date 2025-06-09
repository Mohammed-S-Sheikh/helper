part of 'base_controller.dart';

class FormController<DataT>
    extends BaseController<FormController<DataT>, DataT> {
  FormController(
    this._key, {
    required super.endpoint,
    super.initialData,
    super.onData,
    super.onFailure,
  });

  final GlobalKey<FormBuilderState> _key;
  FormBuilderState? get state => _key.currentState;

  ValidationFailureType? get validation => _failure?.validation;
  List<String>? getValidationErrorOf(String fieldName) =>
      validation?[fieldName];

  T? getValueOf<T>(String fieldName) => state?.fields[fieldName]?.value as T?;
}
