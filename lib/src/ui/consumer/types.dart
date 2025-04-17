import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:helper/src/data/model/model.dart';

typedef ConsumerDataBuilder<DataT> = Widget Function(
  BuildContext context,
  DataT data,
);

typedef ConsumerFailureBuilder = Widget Function(
  BuildContext context,
  ResponseFailure failure,
);
