import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:helper/src/data/model/model.dart';
import 'package:helper/src/data/network/network.dart';

enum BaseControllerState { loading, failure, success }

class BaseController<T> extends ChangeNotifier {
  BaseController(this.entry);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final ApiEntry<T> entry;

  Future<T>? _request;
  Future<T>? get request => _request;

  void trigger() {
    try {
      _setLoading(true);
      _request = ApiRequest.fetch<T>(entry);
    } catch (e) {
      final failure = Failure.fromException(e);
    }
  }

  void _setLoading(bool value) {
    _isLoading = true;
    notifyListeners();
  }

  void _setFailure(Failure value) {
    _isLoading = true;
    notifyListeners();
  }
}
