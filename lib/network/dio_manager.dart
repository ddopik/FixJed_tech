import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
 import 'package:flutter_base_app/flutter_main/screens/service/main/service_features_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
import 'package:flutter_base_app/flutter_main/storage/local_preferences.dart';


class DIOManager {
  static final DIOManager _instance = DIOManager._dio();

  factory DIOManager() => _instance;

  DIOManager._dio();

  Dio get _dio {
    final Dio dio = Dio();
    // dio.options.baseUrl = APIConstants.baseURL;
    dio.options.baseUrl = "https://woocommerce-385096-1584784.cloudwaysapps.com/wp-json/api/v1";
    dio.options.headers = {
      "Accept-Language": LocalPreferences().getAppLanguage(),
    };
    if (LocalPreferences().getUserToken() != '') {
      // print("dio.options.headers" + PrefManager.getUserToken());
      // dio.options.headers = {
      //   "Authorization": "Bearer ${PrefManager.getUserToken()}",
      // };
      //
    }
    return dio;
  }

  // static const String _MAIN_CATEGORY_API = "/products/categories";
  // static const String _FEATURE_PRODUCT_API = "/products";
  // static const String _USER_LOGIN = "/login";
  // static const String _USER_SIGN_UP_MAIL = "/register/email";
  // static const String _USER_SIGN_UP_PHONE = "//register/phone";
  // static const String _CATEGORY_PRODUCTS = "/products?status=publish";
  // static const String _BRANDS_LIST = "/brands?per_page=20";
  // static const String _PRODUCT_SEARCH = "/products?per_page=20&status=publish";

  static const String _MAIN_CATEGORY_API = "/get_cats";
  static const String _SUB_CATEGORY_API = "/get_subcats_by_cat";
  static const String _FEATURE_PRODUCT_API = "/products";
  static const String _USER_LOGIN = "/login";
  static const String _USER_SIGN_UP_MAIL = "/register/email";
  static const String _USER_SIGN_UP_PHONE = "/register/phone";
  static const String _CATEGORY_PRODUCTS = "/products_by_cat";
  static const String _BRANDS_LIST = "/brands?per_page=20";
  static const String _PRODUCT_SEARCH = "/products";

  getCategory({Function onSuccess, Function onError}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _MAIN_CATEGORY_API,
        queryParameters: null);
  }

  getSubCategory(
      {Function onSuccess, Function onError, FixJidService fixJidService}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _SUB_CATEGORY_API,
        queryParameters: {"cat_id": fixJidService.serviceId});
  }





  sendLoginRequest(
      {Function onSuccess,
        Function onError,
        type,
        String userName,
        String password}) {
    var bodyParameter;
    if (type == "phone") {
      bodyParameter = {"op_phone": userName, "op_password": password};
    } else {
      bodyParameter = {"op_email": userName, "op_password": password};
    }

    _sendPostRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: _USER_LOGIN,
      bodyParameters: bodyParameter,
    );
  }

  createUser(
      {Function onSuccess,
        Function onError,
        type,
        @required String firstName,
        @required String lastName,
        @required String userName,
        @required String password,
        String mail,
        String phone}) {
    var bodyParameter;
    var url;
    if (type == "phone") {
      url = _USER_SIGN_UP_PHONE;
    } else {
      url = _USER_SIGN_UP_MAIL;
    }
    bodyParameter = {
      "op_username": userName,
      "op_first_name": firstName,
      "op_last_name": lastName,
      "op_password": password,
      "op_phone": phone,
      "op_email": mail
    };
    _sendPostRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: url,
      bodyParameters: bodyParameter,
    );
  }

  _sendGetRequest(
      {Function onSuccess,
        Function onError,
        String url,
        queryParameters}) async {
    try {
      Response response;
      if (queryParameters == null) {
        response = await _dio.get("/$url");
      } else {
        response = await _dio.get("/$url", queryParameters: queryParameters);
      }
      if (response.statusCode == 200) {
        logger.e(
            "_sendGetRequest onSuccess----> Of Url ${response.request.uri.toString()} " +
                response.toString());
        onSuccess(response.data);
      } else {
        print(
            "_sendGetRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  _sendPostRequest(
      {Function onSuccess(data),
        Function onError(data),
        String url,
        Map bodyParameters}) async {
    try {
      Response response = await _dio.post(url, queryParameters: bodyParameters);

      if (response.statusCode == 200) {
        logger.e("_sendGetRequest onSuccess----> Of Url $url " +
            response.toString());
        onSuccess(response.data);
      } else {
        logger.e(
            "_sendGetRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  handleDioErrorResponse(url, e, onError) {
    try {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        ErrorResponse errorResponse =
        ErrorResponse.fromJson(e.response.headers.map);
        onError(errorResponse);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e?.request);
        print(e?.message);
        onError(e?.response ?? "Un Expected Error");
      }
    } catch (e) {
      logger.e("DioError Of Url $url ---->" + e.toString());
      onError("Un Expected Error");
    }
  }
}

class ErrorResponse {
  String optiqueErrorDetails;
  String optiqueErrorCode;


  ErrorResponse({this.optiqueErrorDetails, this.optiqueErrorCode});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    try {
      return ErrorResponse(
          optiqueErrorDetails: json['optique_error_details'][0],
          optiqueErrorCode: json['optique_error_code'][0]);
    } catch (e) {
      return ErrorResponse(
          optiqueErrorDetails: "Un parsed Error", optiqueErrorCode:"0" );
    }
  }
}
