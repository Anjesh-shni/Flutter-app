import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/app/reusable_widget/snack_bar.dart';
import 'package:zunun/features/presentation/login/model/create_access_model.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';
import '../../presentation/login/views/login_view.dart';

///This class act like baseUrl regardless of any method get or post
class ApiClient extends GetConnect implements GetxService {
  ///This class will talk to the server
  ///Will submit data and receive data
  final localStorage = GetStorage();
  var createAccessFromRefress = CreateAccessModel().obs;
  //Most of the token need to talk to the server
  //That must should initialize here
  late String token;

  //Server Url
  final String appBaseUrl;

  //local storage instance
  late SharedPreferences sharedPreferences;

  //late is used bcz it should be initialize before it used anywhere
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    //Base url is coming from get connect itself,
    baseUrl = appBaseUrl;

    //time used for how long request should try, and then stop
    timeout = const Duration(seconds: 20);

    //Storing token in local database
    //bang operator = !, means strictly saying this is not going to be null
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";

    //Request header, it needed bcz every time api client will talk to the server main header needed
    //Regardless its get request or post request
    //Saying server hey look either its get or post request just send me json data
    //char set for decode encode
    _mainHeaders = {
      "subdomain": "kathmandu",
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
  }

  ///Update header
  ///Bearer type for authorisation
  void updateHeader(String token) {
    _mainHeaders = {
      "subdomain": "kathmandu",
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
  }

  ///Get method and the Response is coming from getX package itself
  ///It contains URL and Headers
  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    log("TOKEN FROM GET REQUEST+++++++++++++++++::::::::::::::::::::::::::::$token");
    try {
      //This method will return response from server and it catches to repository
      //GetX use http inside for server call
      Response response = await get(uri, headers: headers ?? _mainHeaders);

      return response;
    } catch (e) {
      //If it fails show error
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  ///Post method and the Response is coming from getX package itself
  Future<Response> postData(String uri, dynamic body) async {
    debugPrint(body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);

      return response;
    } catch (e) {
      CustomSnackBar(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //update method
  Future<Response> updateData(String uri, dynamic body) async {
    debugPrint(body.toString());
    try {
      Response response = await patch(uri, body, headers: _mainHeaders);
      CustomSnackBar(response.body.toString(), title: "Error");
      return response;
    } catch (e) {
      CustomSnackBar(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //delete method
  Future<Response> deleteData(String uri,
      {Map<String, String>? headers}) async {
    try {
      Response response = await delete(uri, headers: headers ?? _mainHeaders);
      print("from de ERRO++++++++++++++++++::::::::::::::::::::" +
          response.body.toString());
      return response;
    } catch (e) {
      CustomSnackBar(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

//
  Future<Response> refreshToken(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<void> refreshTokenss() async {
    var json_body = {
      "access": localStorage.read(AppConstants.TOKEN),
      "refresh": localStorage.read('refresh_token')
    };
    var response = await http.post(
      Uri.parse(AppConstants.BASE_URL + AppConstants.REFRES_TOKEN),
      headers: {
        "subdomain": "kathmandu",
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: json_body,
    );
    print("REFRESH TOKEN=======================" + response.body.toString());
    if (response.statusCode == 200) {
      CreateAccessModel createAccessfromModel =
          CreateAccessModel.fromJson(jsonDecode(response.body));
      createAccessFromRefress.value = CreateAccessModel(
        success: createAccessfromModel.success,
        data: createAccessfromModel.data,
      );
    } else {
      Get.offAll(() => LoginView());
      Get.rawSnackbar(
        message: 'Token Expired,Please Login Again',
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 100),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
