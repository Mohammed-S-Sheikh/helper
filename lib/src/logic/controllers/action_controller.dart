part of 'base_controller.dart';

class ActionController<DataT>
    extends BaseController<ActionController<DataT>, DataT> {
  ActionController({
    required super.endpoint,
    super.initialData,
    super.onData,
    super.onFailure,
  });
}
