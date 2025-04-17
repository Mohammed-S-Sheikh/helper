import 'package:flutter/material.dart';
import 'package:helper/src/data/network/network.dart';
import 'package:helper/src/ui/consumer/consumer.dart';

class AutoConsumerScreen extends StatelessWidget {
  const AutoConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DataConsumer(
      apiEntry: ApiEntry(''),
      builder: (context, data) {
        return SizedBox();
      },
    );
  }
}
