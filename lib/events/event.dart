import 'dart:core';

import 'package:affise_attribution_lib/events/predefined/predefined_parameters.dart';

/// Base event
abstract class Event {
  /// Event predefined parameters
  Map<PredefinedParameters, String> predefinedParameters = {};

  /// Serialize event to dynamic
  ///
  /// @return dynamic
  dynamic serialize();

  /// Name of event
  ///
  /// @return name
  String getName();

  /// Category of event
  ///
  /// @return category
  String getCategory();

  /// User data
  ///
  /// @return userData
  String? getUserData();

  /// Is first for user, default false
  ///
  /// @return is first for user or not
  bool isFirstForUser() => false;

  /// Add predefined [parameter] with [value] to event
  void addPredefinedParameter(PredefinedParameters parameter, String value) {
    predefinedParameters[parameter] = value;
  }

  /// Get map of predefined parameter
  ///
  /// @return map of predefined parameter
  Map<PredefinedParameters, String> getPredefinedParameters() {
    return predefinedParameters;
  }

  Map<String, dynamic> get toMap {
    return <String, dynamic>{
      'name': getName(),
      'category': getCategory(),
      'userData': getUserData(),
      'firstForUser': isFirstForUser(),
      'serialize': serialize(),
      'predefinedParameters':
          predefinedParameters.map((key, value) => MapEntry(key.value, value)),
    };
  }
}
