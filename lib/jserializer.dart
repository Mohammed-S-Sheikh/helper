// GENERATED CODE. DO NOT MODIFY. Generated by JSerializerGenerator.

// ignore_for_file: type=lint,unnecessary_import,deprecated_member_use_from_same_package,return_of_invalid_type_from_closure,STRICT_RAW_TYPE,prefer-match-file-name,newline-before-return,prefer-trailing-comma,long-method

// **************************************************************************
// JSerializer: Serialization Done Right
// **************************************************************************

import 'package:jserializer/jserializer.dart' as js;
import 'package:helper/src/logic/data/model/feedback/feedback_model.dart';

class FeedbackModelSerializer extends js.ModelSerializer<FeedbackModel> {
  const FeedbackModelSerializer({super.jSerializer});

  static const jsonKeys = {
    'priority',
    'dismissible',
    'type',
    'title',
    'content',
    'action',
  };

  @override
  FeedbackModel fromJson(json) {
    final priority$Value = safeLookup<FeedbackPriority>(
      call: () => jSerializer.fromJson<FeedbackPriority>(json['priority']),
      jsonKey: 'priority',
    );
    final dismissible$Value = safeLookup<bool>(
      call: () => jSerializer.fromJson<bool>(json['dismissible']),
      jsonKey: 'dismissible',
    );
    final type$Value = safeLookup<FeedbackType>(
      call: () => jSerializer.fromJson<FeedbackType>(json['type']),
      jsonKey: 'type',
    );
    final title$Value = safeLookup<String?>(
      call: () => jSerializer.fromJson<String?>(json['title']),
      jsonKey: 'title',
    );
    final content$Value = safeLookup<String>(
      call: () => jSerializer.fromJson<String>(json['content']),
      jsonKey: 'content',
    );
    final action$Value = safeLookup<FeedbackAction?>(
      call: () => jSerializer.fromJson<FeedbackAction?>(json['action']),
      jsonKey: 'action',
    );
    return FeedbackModel(
      priority: priority$Value,
      dismissible: dismissible$Value,
      type: type$Value,
      title: title$Value,
      content: content$Value,
      action: action$Value,
    );
  }

  @override
  Map<String, dynamic> toJson(FeedbackModel model) => {
    'priority': jSerializer.toJson(model.priority),
    'dismissible': model.dismissible,
    'type': jSerializer.toJson(model.type),
    'title': model.title,
    'content': model.content,
    'action': jSerializer.toJson(model.action),
  };
}

class FeedbackPrioritySerializer
    extends js.CustomModelSerializer<FeedbackPriority, String> {
  const FeedbackPrioritySerializer({super.jSerializer});

  @override
  FeedbackPriority fromJson(String json) {
    if (json == 'banner') return FeedbackPriority.banner;

    if (json == 'dialog') return FeedbackPriority.dialog;

    if (json == 'snackbar') return FeedbackPriority.snackbar;

    throw Exception(
      'JSerializationException in Enum of type $FeedbackPriority '
      'Unknown enum value: $json',
    );
  }

  @override
  String toJson(FeedbackPriority model) {
    switch (model) {
      case FeedbackPriority.banner:
        return 'banner';

      case FeedbackPriority.dialog:
        return 'dialog';

      case FeedbackPriority.snackbar:
        return 'snackbar';
    }
  }
}

class FeedbackTypeSerializer
    extends js.CustomModelSerializer<FeedbackType, String> {
  const FeedbackTypeSerializer({super.jSerializer});

  @override
  FeedbackType fromJson(String json) {
    if (json == 'normal') return FeedbackType.normal;

    if (json == 'failure') return FeedbackType.failure;

    if (json == 'success') return FeedbackType.success;

    throw Exception(
      'JSerializationException in Enum of type $FeedbackType '
      'Unknown enum value: $json',
    );
  }

  @override
  String toJson(FeedbackType model) {
    switch (model) {
      case FeedbackType.normal:
        return 'normal';

      case FeedbackType.failure:
        return 'failure';

      case FeedbackType.success:
        return 'success';
    }
  }
}

class FeedbackActionSerializer extends js.ModelSerializer<FeedbackAction> {
  const FeedbackActionSerializer({super.jSerializer});

  static const jsonKeys = {'label', 'type'};

  @override
  FeedbackAction fromJson(json) {
    final label$Value = safeLookup<String>(
      call: () => jSerializer.fromJson<String>(json['label']),
      jsonKey: 'label',
    );
    final type$Value = safeLookup<FeedbackActionType>(
      call: () => jSerializer.fromJson<FeedbackActionType>(json['type']),
      jsonKey: 'type',
    );
    return FeedbackAction(label: label$Value, type: type$Value);
  }

  @override
  Map<String, dynamic> toJson(FeedbackAction model) => {
    'label': model.label,
    'type': jSerializer.toJson(model.type),
  };
}

class FeedbackNavActionSerializer
    extends js.ModelSerializer<FeedbackNavAction> {
  const FeedbackNavActionSerializer({super.jSerializer});

  static const jsonKeys = {'behavior', 'destination'};

  @override
  FeedbackNavAction fromJson(json) {
    final behavior$Value = safeLookup<FeedbackNavActionBehavior>(
      call:
          () =>
              jSerializer.fromJson<FeedbackNavActionBehavior>(json['behavior']),
      jsonKey: 'behavior',
    );
    final destination$Value = safeLookup<String>(
      call: () => jSerializer.fromJson<String>(json['destination']),
      jsonKey: 'destination',
    );
    return FeedbackNavAction(
      behavior: behavior$Value,
      destination: destination$Value,
    );
  }

  @override
  Map<String, dynamic> toJson(FeedbackNavAction model) => {
    'behavior': jSerializer.toJson(model.behavior),
    'destination': model.destination,
    'type': 'navigation',
  };
}

class FeedbackActionTypeSerializer
    extends js.ModelSerializer<FeedbackActionType> {
  const FeedbackActionTypeSerializer({super.jSerializer});

  @override
  FeedbackActionType fromJson(json) {
    final type = json['type'];
    if (type is! String) {
      throw Exception(
        'The json field of type named (type) that was passed'
        'using fromJson of model FeedbackActionType) is not a String!\actual value: $type',
      );
    }
    switch (type) {
      case 'navigation':
        return jSerializer.fromJson<FeedbackNavAction>(json);
      default:
        throw Exception('Unknown type $type of union type FeedbackActionType');
    }
  }

  @override
  Map<String, dynamic> toJson(FeedbackActionType model) {
    if (model is FeedbackNavAction) {
      return {
        'type': 'navigation',
        ...(jSerializer.toJson(model) as Map<String, dynamic>),
      };
    }
    throw Exception('Unknown type of union value: $model');
  }
}

class FeedbackNavActionBehaviorSerializer
    extends js.CustomModelSerializer<FeedbackNavActionBehavior, String> {
  const FeedbackNavActionBehaviorSerializer({super.jSerializer});

  @override
  FeedbackNavActionBehavior fromJson(String json) {
    if (json == 'push') return FeedbackNavActionBehavior.push;

    if (json == 'pop') return FeedbackNavActionBehavior.pop;

    if (json == 'replace') return FeedbackNavActionBehavior.replace;

    if (json == 'renew') return FeedbackNavActionBehavior.renew;

    throw Exception(
      'JSerializationException in Enum of type $FeedbackNavActionBehavior '
      'Unknown enum value: $json',
    );
  }

  @override
  String toJson(FeedbackNavActionBehavior model) {
    switch (model) {
      case FeedbackNavActionBehavior.push:
        return 'push';

      case FeedbackNavActionBehavior.pop:
        return 'pop';

      case FeedbackNavActionBehavior.replace:
        return 'replace';

      case FeedbackNavActionBehavior.renew:
        return 'renew';
    }
  }
}

class FeedbackModelMocker extends js.JModelMocker<FeedbackModel> {
  const FeedbackModelMocker({super.jSerializer});

  @override
  FeedbackModel createMock([js.JMockerContext? context]) {
    final prevLevel = context?.currentDepthLevel ?? 0;
    final currentLevel = prevLevel + 1;
    final priority$Value = subMock<FeedbackPriority>(
      context: context,
      fieldName: 'priority',
      currentLevel: currentLevel,
    );
    final dismissible$Value = subMock<bool>(
      context: context,
      fieldName: 'dismissible',
      currentLevel: currentLevel,
    );
    final type$Value = subMock<FeedbackType>(
      context: context,
      fieldName: 'type',
      currentLevel: currentLevel,
    );
    final title$Value = subMock<String?>(
      context: context,
      fieldName: 'title',
      currentLevel: currentLevel,
    );
    final content$Value = subMock<String>(
      context: context,
      fieldName: 'content',
      currentLevel: currentLevel,
    );
    final action$Value = subMock<FeedbackAction?>(
      context: context,
      fieldName: 'action',
      currentLevel: currentLevel,
    );
    return FeedbackModel(
      priority: priority$Value,
      dismissible: dismissible$Value,
      type: type$Value,
      title: title$Value,
      content: content$Value,
      action: action$Value,
    );
  }
}

class FeedbackPriorityMocker extends js.JCustomMocker<FeedbackPriority> {
  const FeedbackPriorityMocker({super.jSerializer});

  @override
  FeedbackPriority createMock([js.JMockerContext? context]) {
    return optionallyRandomizedValueFromList(context, FeedbackPriority.values);
  }
}

class FeedbackTypeMocker extends js.JCustomMocker<FeedbackType> {
  const FeedbackTypeMocker({super.jSerializer});

  @override
  FeedbackType createMock([js.JMockerContext? context]) {
    return optionallyRandomizedValueFromList(context, FeedbackType.values);
  }
}

class FeedbackActionMocker extends js.JModelMocker<FeedbackAction> {
  const FeedbackActionMocker({super.jSerializer});

  @override
  FeedbackAction createMock([js.JMockerContext? context]) {
    final prevLevel = context?.currentDepthLevel ?? 0;
    final currentLevel = prevLevel + 1;
    final label$Value = subMock<String>(
      context: context,
      fieldName: 'label',
      currentLevel: currentLevel,
    );
    final type$Value = subMock<FeedbackActionType>(
      context: context,
      fieldName: 'type',
      currentLevel: currentLevel,
    );
    return FeedbackAction(label: label$Value, type: type$Value);
  }
}

class FeedbackNavActionMocker extends js.JModelMocker<FeedbackNavAction> {
  const FeedbackNavActionMocker({super.jSerializer});

  @override
  FeedbackNavAction createMock([js.JMockerContext? context]) {
    final prevLevel = context?.currentDepthLevel ?? 0;
    final currentLevel = prevLevel + 1;
    final behavior$Value = subMock<FeedbackNavActionBehavior>(
      context: context,
      fieldName: 'behavior',
      currentLevel: currentLevel,
    );
    final destination$Value = subMock<String>(
      context: context,
      fieldName: 'destination',
      currentLevel: currentLevel,
    );
    return FeedbackNavAction(
      behavior: behavior$Value,
      destination: destination$Value,
    );
  }
}

class FeedbackActionTypeMocker extends js.JCustomMocker<FeedbackActionType> {
  const FeedbackActionTypeMocker({super.jSerializer});

  @override
  FeedbackActionType createMock([js.JMockerContext? context]) {
    return optionallyRandomizedValueFromListLazy(context, [
      () => jSerializer.createMock<FeedbackNavAction>(context: context),
    ]);
  }
}

class FeedbackNavActionBehaviorMocker
    extends js.JCustomMocker<FeedbackNavActionBehavior> {
  const FeedbackNavActionBehaviorMocker({super.jSerializer});

  @override
  FeedbackNavActionBehavior createMock([js.JMockerContext? context]) {
    return optionallyRandomizedValueFromList(
      context,
      FeedbackNavActionBehavior.values,
    );
  }
}

void initializeJSerializer({js.JSerializerInterface? jSerializer}) {
  final instance = jSerializer ?? js.JSerializer.i;
  instance.register<FeedbackModel>(
    (s) => FeedbackModelSerializer(jSerializer: s),
    (Function f) => f<FeedbackModel>(),
    mockFactory: (s) => FeedbackModelMocker(jSerializer: s),
  );
  instance.register<FeedbackPriority>(
    (s) => FeedbackPrioritySerializer(jSerializer: s),
    (Function f) => f<FeedbackPriority>(),
    mockFactory: (s) => FeedbackPriorityMocker(jSerializer: s),
  );
  instance.register<FeedbackType>(
    (s) => FeedbackTypeSerializer(jSerializer: s),
    (Function f) => f<FeedbackType>(),
    mockFactory: (s) => FeedbackTypeMocker(jSerializer: s),
  );
  instance.register<FeedbackAction>(
    (s) => FeedbackActionSerializer(jSerializer: s),
    (Function f) => f<FeedbackAction>(),
    mockFactory: (s) => FeedbackActionMocker(jSerializer: s),
  );
  instance.register<FeedbackNavAction>(
    (s) => FeedbackNavActionSerializer(jSerializer: s),
    (Function f) => f<FeedbackNavAction>(),
    mockFactory: (s) => FeedbackNavActionMocker(jSerializer: s),
  );
  instance.register<FeedbackActionType>(
    (s) => FeedbackActionTypeSerializer(jSerializer: s),
    (Function f) => f<FeedbackActionType>(),
    mockFactory: (s) => FeedbackActionTypeMocker(jSerializer: s),
  );
  instance.register<FeedbackNavActionBehavior>(
    (s) => FeedbackNavActionBehaviorSerializer(jSerializer: s),
    (Function f) => f<FeedbackNavActionBehavior>(),
    mockFactory: (s) => FeedbackNavActionBehaviorMocker(jSerializer: s),
  );
}
