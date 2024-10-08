import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shamel_delivery_app/api/api_client.dart';
import 'package:shamel_delivery_app/common/models/response_model.dart';
import 'package:shamel_delivery_app/features/profile/domain/models/profile_model.dart';
import 'package:shamel_delivery_app/util/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shamel_delivery_app/features/forgot_password/domain/repositories/forgot_password_repository_interface.dart';

class ForgotPasswordRepository implements ForgotPasswordRepositoryInterface {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  ForgotPasswordRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future<ResponseModel> changePassword(ProfileModel userInfoModel, String password) async {
    ResponseModel responseModel;
    Response response = await apiClient.postData(AppConstants.updateProfileUri, {'_method': 'put', 'f_name': userInfoModel.fName,
      'l_name': userInfoModel.lName, 'email': userInfoModel.email, 'password': password, 'token': _getUserToken()}, handleError: false);
    if(response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
    }else{
      responseModel = ResponseModel(false, response.statusText);
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> forgetPassword(String? phone) async {
    ResponseModel responseModel;
    String? deviceToken = await _saveDeviceToken();
    Response response = await apiClient.postData(AppConstants.forgetPasswordUri, {"phone": phone, "fcm_token" : deviceToken}, handleError: false);
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> verifyToken(String? phone, String token) async {
    ResponseModel responseModel;
    Response response = await apiClient.postData(AppConstants.verifyTokenUri, {"phone": phone, "reset_token": token}, handleError: false);
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> resetPassword(String? resetToken, String phone, String password, String confirmPassword) async {
    ResponseModel responseModel;
    Response response = await apiClient.postData(AppConstants.resetPasswordUri,
      {"_method": "put", "phone": phone, "reset_token": resetToken, "password": password, "confirm_password": confirmPassword}, handleError: false);
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    return responseModel;
  }

  String _getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  Future<String?> _saveDeviceToken() async {
    String? deviceToken = '';
    if(!GetPlatform.isWeb) {
      deviceToken = (await FirebaseMessaging.instance.getToken())!;
    }
    debugPrint('----Device Token----- $deviceToken');
    return deviceToken;
  }

  @override
  Future add(value) {
    throw UnimplementedError();
  }

  @override
  Future delete(int? id) {
    throw UnimplementedError();
  }

  @override
  Future get(int? id) {
    throw UnimplementedError();
  }

  @override
  Future getList() {
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body) {
    throw UnimplementedError();
  }

}