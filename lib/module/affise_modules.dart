import 'package:collection/collection.dart';

enum AffiseModules {
  ADVERTISING,
  NETWORK,
  PHONE,
  STATUS;

  static AffiseModules? fromString(String? value) {
    if (value == null) return null;
    return AffiseModules.values.firstWhereOrNull((e) => e.value == value);
  }
}

extension AffiseModulesExt on AffiseModules {
  String get value {
    switch (this) {
      case AffiseModules.ADVERTISING:
        return "Advertising";
      case AffiseModules.NETWORK:
        return "Network";
      case AffiseModules.PHONE:
        return "Phone";
      case AffiseModules.STATUS:
        return "Status";
    }
  }
}
