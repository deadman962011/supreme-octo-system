import 'package:shamel_delivery_app/features/profile/domain/models/profile_model.dart';
import 'package:shamel_delivery_app/interface/repository_interface.dart';

abstract class ForgotPasswordRepositoryInterface implements RepositoryInterface {
  Future<dynamic> changePassword(ProfileModel userInfoModel, String password);
  Future<dynamic> forgetPassword(String? phone);
  Future<dynamic> verifyToken(String? phone, String token);
  Future<dynamic> resetPassword(String? resetToken, String phone, String password, String confirmPassword);
}