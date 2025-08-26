import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:helper/src/logic/data/model/model.dart';
import 'package:helper/src/logic/data/network/network.dart';
import 'package:jserializer/jserializer.dart';

part 'action_controller.dart';
part 'data_controller.dart';
part 'form_controller.dart';

typedef ControllerOnData<ControllerT, DataT> = FutureOr<void> Function(
  ControllerT controller,
  DataT data,
);

typedef ControllerOnFailure<ControllerT> = FutureOr<void> Function(
  ControllerT controller,
  Failure failure,
);

abstract class BaseController<ControllerT, DataT> with ChangeNotifier {
  BaseController({
    required this.endpoint,
    DataT? initialData,
    ControllerOnData<ControllerT, DataT>? onData,
    ControllerOnFailure<ControllerT>? onFailure,
  })  : _onData = onData,
        _onFailure = onFailure {
    if (initialData != null) {
      _data = initialData;
      notifyListeners();
    }
  }

  final Endpoint endpoint;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  DataT? _data;
  DataT? get data => _data;
  ControllerOnData<ControllerT, DataT>? _onData;
  ControllerOnData<ControllerT, DataT>? get onData => _onData;
  DataT _adaptData(Result<DataT> result) => result.data!;

  Failure? _failure;
  Failure? get failure => _failure;
  ControllerOnFailure<ControllerT>? _onFailure;
  ControllerOnFailure<ControllerT>? get onFailure => _onFailure;
  Failure _adaptFailure(Result<DataT> result) => result.failure!;

  bool get isSuccessful => !isLoading && failure == null;

  @nonVirtual
  Future<void> request({
    Json? body,
    Json? queryParameters,
  }) async {
    try {
      _setLoading(true);

      final endpoint =
          this.endpoint.copyWith(body: body, queryParameters: queryParameters);
      final result = await Api.request<DataT>(endpoint);

      if (result.failure != null) {
        final failure = _adaptFailure(result);
        _setFailure(failure);
        await _onFailure?.call(this as ControllerT, failure);
      }

      final data = _adaptData(result);
      _setData(data);
      await _onData?.call(this as ControllerT, data);
    } catch (e) {
      _setFailure(Failure.fromException(e));
    } finally {
      _setLoading(false);
    }
  }

  void setOnData(ControllerOnData<ControllerT, DataT> onData) {
    _onData = onData;
  }

  void setOnFailure(ControllerOnFailure<ControllerT> onFailure) {
    _onFailure = onFailure;
  }

  @nonVirtual
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  @nonVirtual
  void _setData(DataT data) {
    _data = data;
    _failure = null;
    notifyListeners();
  }

  @nonVirtual
  void _setFailure(Failure failure) {
    _data = null;
    _failure = failure;
    notifyListeners();
  }
}
