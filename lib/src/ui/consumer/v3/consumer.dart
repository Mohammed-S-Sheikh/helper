import 'package:flutter/material.dart';
import 'package:helper/src/ui/consumer/v3/base_controller.dart';

class Consumer<ControllerT extends BaseController> extends StatelessWidget {
  const Consumer({
    super.key,
    required this.controller,
  });

  final BaseController controller;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
