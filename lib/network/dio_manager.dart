
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';

import 'APIConstants.dart';


class DIOManager {
  static final DIOManager _instance = DIOManager._dio();

  factory DIOManager() => _instance;

  DIOManager._dio();

  Dio get _dio {
    final Dio dio = Dio();
    dio.options.baseUrl = APIConstants.baseURL;
    // dio.options.baseUrl = "https://woocommerce-385096-1584784.cloudwaysapps.com/wp-json/api/v1";
    dio.options.headers = APIConstants.headers;
    return dio;
  }

  static const String _MAIN_CATEGORY_API = "/products/categories";
  static const String _FEATURE_PRODUCT_API = "/products";
  static const String _USER_LOGIN = "/login";
  static const String _USER_SIGN_UP_MAIL = "/register/email";
  static const String _USER_SIGN_UP_PHONE = "//register/phone";
  static const String _CATEGORY_PRODUCTS = "/products?status=publish";
  static const String _BRANDS_LIST = "/brands?per_page=20";
  static const String _PRODUCT_SEARCH = "/products?per_page=20&status=publish";

  getMainCategory({Function onSuccess, Function onError}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _MAIN_CATEGORY_API,
        queryParameters: null);
  }

  getFeatureProducts({Function onSuccess, Function onError}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _FEATURE_PRODUCT_API,
        queryParameters: {"feature": "true"});
  }

  geCategoryProducts({onSuccess, onError, categoryId}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _CATEGORY_PRODUCTS,
        queryParameters: {"category":categoryId});
  }

  getBrands({onSuccess, onError, page}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _BRANDS_LIST,
        queryParameters: {"page":page});
  }

  getProductSearch({onSuccess, onError,searchKey, page}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _PRODUCT_SEARCH,
        queryParameters: {"page":page,"search":searchKey});
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
      "op_mail": mail
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

        logger.e("_sendGetRequest onSuccess----> Of Url ${response.request.uri.toString()} " +
            response.toString());
        onSuccess(response.data);
      } else {
        print(
            "_sendGetRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        logger.e("_sendGetRequest onSuccess----> Of Url ${e.response.request.uri.toString()} " );
        print(e.response.data);
        print(e.response.request);
        onError(e.response);
      } else {
        logger.e("_sendGetRequest onSuccess----> Of Url ${e.response.request.uri.toString()} " );
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
        onError(e.response);
      }
    }
  }

  _sendPostRequest(
      {Function onSuccess(data),
      Function onError(data),
      String url,
      Map bodyParameters}) async {
    try {
      Response response =
          await _dio.post("/$url", queryParameters: bodyParameters);

      if (response.statusCode == 200) {
        logger.e("_sendGetRequest onSuccess----> Of Url $url " +
            response.toString());
        onSuccess(response.data);
      } else {
        print(
            "_sendGetRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.request);
        onError(e.response.statusMessage);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
        onError(e.response);
      }
    }
  }
}
