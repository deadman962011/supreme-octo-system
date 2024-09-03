import 'package:shamel_delivery_app/interface/repository_interface.dart';

abstract class HtmlRepositoryInterface extends RepositoryInterface {
  Future<dynamic> getHtmlText(bool isPrivacyPolicy);
}