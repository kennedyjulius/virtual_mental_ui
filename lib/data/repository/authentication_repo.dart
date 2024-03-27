import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/authentication/login_screen.dart';
import 'package:virtual_assistance_2/data/api/api_client.dart';
import 'package:virtual_assistance_2/model/login_model.dart';
import 'package:virtual_assistance_2/model/registration_model.dart';
import 'package:virtual_assistance_2/model/user_model.dart';
import 'package:virtual_assistance_2/utils/app_constants.dart';


class AuthRepo{
  final ApiClient apiClient;
  AuthRepo({
    required this.apiClient, required String appBaseUrl,
  });

  Future<Response> registration(RegisterUser registerUser) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URI, registerUser.toJson());
  }

  Future<Response> login(UserLogin userLogin) async {
     print("called on login");
     print(userLogin.toJson());
    var user= await apiClient.postData(AppConstants.LOGIN_URI, userLogin.toJson());
    return user;
  }
  // Future<bool>saveUserToken(String token) async {
  //   apiClient.token = token;
  //   apiClient.updateHeader(token);
  //   SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  //   // print(AppConstants.TOKEN);
  //   return  sharedPreferences.setString(AppConstants.TOKEN, token); 

  // }
    Future<bool>saveUser(String user) async {
   
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    // print(AppConstants.TOKEN);
    return  sharedPreferences.setString('user', user); 

  }
    Future<bool>saveUserModel(UserModel user) async {
   
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    // print(AppConstants.TOKEN);
    return  sharedPreferences.setString('user', jsonEncode(user.toJson())); 

  }
  Future<UserModel?> getUser() async{
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var stringUser=  sharedPreferences.getString('user'); 
    // print(stringUser);
           if(stringUser==null){
            Get.to(LoginScreen());
            print("user is null, printing from auth repo");
            return null;
           }
     return UserModel.fromJson(jsonDecode(stringUser));
  }
  static Future<UserModel?> getUserInstance() async{
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var stringUser=  sharedPreferences.getString('user'); 
 if(stringUser==null){
            return null;
           }
     return UserModel.fromJson(jsonDecode(stringUser));
  }
  static Future<bool?> deleteUserInstance() async{
        SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return sharedPreferences.remove('user'); 

  }
}