import 'package:shamel_delivery_app/interface/repository_interface.dart';

abstract class SplashRepositoryInterface extends RepositoryInterface {
  Future<dynamic> getConfigData();
  Future<bool> initSharedData();
  Future<bool> removeSharedData();
}