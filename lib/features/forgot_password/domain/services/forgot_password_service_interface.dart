import 'package:shamel_delivery_app/common/models/response_model.dart';
import 'package:shamel_delivery_app/features/profile/domain/models/profile_model.dart';

abstract class ForgotPasswordServiceInterface {
  Future<ResponseModel> changePassword(ProfileModel userInfoModel, String password);
  Future<ResponseModel> forgetPassword(String? phone);
  Future<ResponseModel> verifyToken(String? phone, String token);
  Future<ResponseModel> resetPassword(String? resetToken, String phone, String password, String confirmPassword);
}