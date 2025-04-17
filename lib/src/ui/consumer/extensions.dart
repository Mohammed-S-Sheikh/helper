import 'package:flutter/material.dart';
import 'package:helper/src/data/model/model.dart';

extension AsyncSnapshotX<DataT> on AsyncSnapshot<DataT> {
  ResultT map<ResultT>({
    required ResultT Function() loading,
    required ResultT Function(DataT data) loaded,
    required ResultT Function(ResponseFailure failure) failed,
  }) {
    if (connectionState.loading) {
      return loading();
    }

    if (hasError) {
      final failure = ResponseFailure.fromException(error!);
      return failed(failure);
    }

    return loaded(data as DataT);
  }
}

extension ConnectionStateX on ConnectionState {
  bool get loading =>
      this == ConnectionState.waiting || this == ConnectionState.none;
}
