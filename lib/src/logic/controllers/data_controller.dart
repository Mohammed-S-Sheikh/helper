part of 'base_controller.dart';

class DataController<DataT>
    extends BaseController<DataController<DataT>, DataT> {
  DataController({
    required super.endpoint,
    super.initialData,
    bool enableMock = true,
    DataT? mockOverride,
    super.onData,
    super.onFailure,
  })  : _enableMock = enableMock,
        _mockOverride = mockOverride;

  final bool _enableMock;
  final DataT? _mockOverride;

  @override
  DataT? get data {
    if (_isLoading && _enableMock) {
      return _mockOverride ?? _getMockData();
    }

    return _data;
  }

  DataT _getMockData() {
    final mockerContext = JMockerContext(
      nullifyAfterDepth: 12,
      options: {
        'list': {'maxCount': 12},
      },
    )..setCallCount(10);

    return JSerializer.createMock<DataT>(context: mockerContext);
  }
}
