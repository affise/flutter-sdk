import 'affise_link_callback.dart';

abstract class AffiseModuleLinkApi {
  void resolve(String url, AffiseLinkCallback callback);
}
