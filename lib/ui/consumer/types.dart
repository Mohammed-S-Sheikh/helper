import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:helper/data/data.dart';

typedef ConsumerDataBuilder<DataT> = Widget Function(
  BuildContext context,
  DataT data,
);

typedef ConsumerErrorBuilder = Widget Function(
  BuildContext context,
  ResponseFailure failure,
);
