enum AffiseFlag {
  IOS_REQUEST_ADID,
}

extension AffiseFlagValue on AffiseFlag {
  String get value {
    switch (this) {
      case AffiseFlag.IOS_REQUEST_ADID:
        return "IOS_REQUEST_ADID";
      default:
        return "";
    }
  }
}

extension AffiseFlagList on List<AffiseFlag> {
  List<String> get toStringList {
    return map((e) => e.value).toList();
  }
}
