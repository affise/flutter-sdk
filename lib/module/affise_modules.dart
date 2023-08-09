enum AffiseModules { ADVERTISING, NETWORK, PHONE, STATUS }

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
