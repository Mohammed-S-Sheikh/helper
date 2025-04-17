import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:helper/src/data/network/network.dart';

class BaseController<T> extends ChangeNotifier {
  BaseController(this.entry);

  final ApiEntry<T> entry;

  Future<T>? _request;
  Future<T>? get request => _request;

  void trigger() {
    _request = ApiRequest.fetch<T>(entry);
    notifyListeners();
  }
}
