import 'dart:core';
import 'dart:ffi';

import 'package:affise_attribution_lib/events/parameters/predefined_object.dart';

import 'parameters/predefined_float.dart';
import 'parameters/predefined_list_object.dart';
import 'parameters/predefined_list_string.dart';
import 'parameters/predefined_long.dart';
import 'parameters/predefined_string.dart';

/// Base event
abstract class Event {
  /// Event predefined parameters
  Map<String, dynamic> predefinedParameters = {};

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

  /// Add predefined [parameter] with [value] of double to event
  void addPredefinedFloat(PredefinedFloat parameter, double value) {
    predefinedParameters[parameter.value] = value;
  }

  /// Add predefined [parameter] with [value] of List<Map<String, dynamic>> to event
  void addPredefinedListObject(PredefinedListObject parameter, List<Map<String, dynamic>> value) {
    predefinedParameters[parameter.value] = value;
  }

  /// Add predefined [parameter] with [value] of List<String> to event
  void addPredefinedListString(PredefinedListString parameter, List<String> value) {
    predefinedParameters[parameter.value] = value;
  }

  /// Add predefined [parameter] with [value] of int to event
  void addPredefinedLong(PredefinedLong parameter, int value) {
    predefinedParameters[parameter.value] = value;
  }

  /// Add predefined [parameter] with [value] of Map<String, dynamic> to event
  void addPredefinedObject(PredefinedObject parameter, Map<String, dynamic> value) {
    predefinedParameters[parameter.value] = value;
  }

  /// Add predefined [parameter] with [value] of String to event
  void addPredefinedString(PredefinedString parameter, String value) {
    predefinedParameters[parameter.value] = value;
  }

  /// Get map of predefined parameter
  ///
  /// @return map of predefined parameter
  Map<String, dynamic> getPredefinedParameters() {
    return predefinedParameters;
  }
}
