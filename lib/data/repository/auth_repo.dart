import 'dart:convert';

import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/moduls/signup_body_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {

  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences, });

 Future<Response> registration(SignUpBody signUpBody) async{
  return await apiClient.post(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  savaUserToken(String token) async{
   apiClient.token =token;
   apiClient.updateHeader(token);
   return await sharedPreferences .setString(AppConstants.TOKEN, token);
  }
}