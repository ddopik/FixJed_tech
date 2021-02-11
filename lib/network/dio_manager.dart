import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base_app/flutter_main/common/model/ErrorResponse.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/screens/login/model/loginResponse.dart';
import 'package:flutter_base_app/flutter_main/storage/pref_manager.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class DIOManager {
  static final DIOManager _instance = DIOManager._dio();

  factory DIOManager() => _instance;

  DIOManager._dio();

  Dio get _dio {
    final Dio dio = Dio();

    dio.options.baseUrl = "http://34.193.99.151:8080/fix-jed";
    dio.options.headers = {
      "Accept-Language": currentLanguage,
    };
    print("Header AcceptedLanguage --- >" + currentLanguage.toString());
    if (PrefManager().getUserToken() != null) {
      dio.options.headers = {
        "Authorization": "${PrefManager().getUserToken()}",
        "email": "${PrefManager().getUserMail()}",
      };
    }
    print(dio.options.headers.toString());
    return dio;
  }

  static const ERROR_CODE_UN_REACHABLE = "4";

  static const String _USER_LOGIN = "/auth/login";
  static const String _USER_FORGOT_PASSWORD_MAIL = "/auth/reset-password";
  static const String _USER_SIGN_UP_MAIL = "/auth/register";
  static const String _GET_MAIN_CATEGORY = "/category/find-all-parents";
  static const String _GET_SUB_CATEGORY = "/category/find-all-by-parent-id";
  static const String _GET_PRODUCT = "/product/find-all-by-category-id";
  static const String _GET_CART_PRODUCT = "/cart/find-all-product-in-cart";
  static const String _ADD_PRODUCT_TO_CART = "/cart/increase-product-to-cart";
  static const String _SUBTRACT_PRODUCT_FROM_CART =
      "/cart/delete-product-from-cart";
  static const String _REMOVE_PRODUCT_FROM_CART =
      "/cart/delete-product-from-cart";
  static const String _REMOVE_CATEGORY_FROM_CART =
      "/cart/delete-category-from-cart";
  static const String GET_SAVED_ADDRESS = "/address/find-all-addresses";
  static const String GET_CITIES = "/city/find-all";
  static const String GET_REGION = "/address/find-by-id/";
  static const String SUBMIT_NEW_ADDRESS = "/address/add-new-address";
  static const String EDIT_ADDRESS = "/address/update-by-id";
  static const String SUBMIT_TRANSACTION = "/transaction/add";
  static const String GET_ALL_SUBMIT_TRANSACTION =
      "/transaction/find-all-by-status?transaction-status=SUBMITTED";
  static const String GET_ALL_CONFIRMED_TRANSACTION =
      "/transaction/find-all-by-status?transaction-status=CONFIRMED";
  static const String GET_ALL_CANCELED_TRANSACTION =
      "/transaction/find-all-by-status?transaction-status=CANCELLED";
  static const String GET_ALL_UPCOMING_TRANSACTION =
      "/transaction/find-all-by-status?transaction-status=UPCOMING";
  static const String GET_ALL_DELIVERED_TRANSACTION =
      "/transaction/find-all-by-status?transaction-status=DELIVERED";

  sendLoginRequest(
      {Function onSuccess,
      Function onError,
      String userName,
      String password}) async {
    var bodyParameter;

    bodyParameter = {
      "username": userName.toString(),
      "password": password.trim()
    };
    print("Body userName --->" + trimAll(userName) + "--");
    print("Body password --->" + trimAll(password) + "--");
    try {
      Response response = await _dio.post(_USER_LOGIN, data: bodyParameter);

      if (response.statusCode == 200) {
        logger.e("_sendGetRequest onSuccess----> Of Url $_USER_LOGIN " +
            response.toString());

        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        loginResponse.token = response.headers.map['authorization'][0];
        onSuccess(loginResponse);
      } else {
        logger.e("_sendGetRequest onError----> Of Url $_USER_LOGIN " +
            response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(_USER_LOGIN, e, onError);
    }
    // _sendPostRequest(onSuccess: onSuccess,onError: onError, url: _USER_LOGIN,bodyParameters: bodyParameter);
  }

  sendForgotPasswordMailRequest(
      {Function onSuccess, Function onError, type, String userName}) {
    print("sendForgotPasswordMailRequest ---> $userName");
    var bodyParameter = {"email": userName};
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _USER_FORGOT_PASSWORD_MAIL,
        queryParameters: bodyParameter);
  }

  createUser(
      {Function onSuccess,
      Function onError,
      type,
      @required String firstName,
      @required String lastName,
      @required String password,
      @required String userName,
      @required String mail,
      String phone}) {
    var bodyParameter;
    var url;

    url = _USER_SIGN_UP_MAIL;

    bodyParameter = {
      "username": userName,
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "confirmPassword": password,
      "phone": phone,
      "email": mail
    };
    _sendPostRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: url,
      bodyParameters: bodyParameter,
    );
  }

  getMainCategory({Function onSuccess, Function onError}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _GET_MAIN_CATEGORY,
        queryParameters: null);
  }

  getServiceProduct({Function onSuccess, Function onError, serviceId}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _GET_PRODUCT,
        queryParameters: {"category-id": serviceId});
  }

  getSubCategory({Function onSuccess, Function onError, categoryId}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _GET_SUB_CATEGORY,
        queryParameters: {"parent-id": categoryId});
  }

  addProductToCart({Function onSuccess, Function onError, productId}) {
    _sendPostRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _ADD_PRODUCT_TO_CART,
        queryParameters: {"product-id": productId});
  }

  submitNewAddress(
      {Function onSuccess,
      Function onError,
      addressId,
      title,
      streetName,
      apartmentNumber,
      buildingNumber,
      floorNumber,
      regionId,
      description}) {
    _sendPostRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: SUBMIT_NEW_ADDRESS,
        bodyParameters: {
          "title": title,
          "streetName": streetName,
          "apartmentNumber": apartmentNumber,
          "buildingNumber": buildingNumber,
          "floorNumber": floorNumber,
          "regionId": regionId,
          "description": description,
        });
  }

  editAddress(
      {Function onSuccess,
      Function onError,
      addressId,
      title,
      streetName,
      apartmentNumber,
      buildingNumber,
      floorNumber,
      regionId,
      description}) {
    _sendPutRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: EDIT_ADDRESS,
        bodyParameters: {
          "id": addressId,
          "title": title,
          "streetName": streetName,
          "apartmentNumber": apartmentNumber,
          "buildingNumber": buildingNumber,
          "floorNumber": floorNumber,
          "regionId": regionId,
          "description": description,
        });
  }

  subtractProductFromCart({Function onSuccess, Function onError, productId}) {
    _sendDeleteRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _SUBTRACT_PRODUCT_FROM_CART,
        queryParameters: {"product-id": productId});
  }

  removeProductFromCart({Function onSuccess, Function onError, productId}) {
    _sendDeleteRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _REMOVE_PRODUCT_FROM_CART,
        queryParameters: {"product-id": productId});
  }

  removeCategoryFromCart({Function onSuccess, Function onError, productId}) {
    _sendDeleteRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _REMOVE_CATEGORY_FROM_CART,
        queryParameters: {"category-id": productId});
  }

  getCartProducts({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: _GET_CART_PRODUCT,
    );
  }

  getSavedAddress({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: GET_SAVED_ADDRESS,
    );
  }

  getCities({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: GET_CITIES,
    );
  }

  getCitiesRegion({Function onSuccess, Function onError, cityId}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: GET_REGION,
        queryParameters: {"address-id-id:$cityId"});
  }


  getAllTransaction({Function onSuccess, Function onError, cityId}) {
    _sendGetRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: GET_ALL_SUBMIT_TRANSACTION,);
  }

  submitTransaction(
      {addressId, paymentId, Function onSuccess, Function onError}) {
    // addressId = int.parse(addressId);
    _sendPostRequest(
      onSuccess: onSuccess,
      onError: onError,
      bodyParameters: {"paymentId": paymentId, "addressId": addressId},
      url: SUBMIT_TRANSACTION,
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

  _sendDeleteRequest(
      {Function onSuccess(data),
      Function onError(data),
      String url,
      queryParameters,
      bodyParameters}) async {
    try {
      Response response;
      if (queryParameters != null && bodyParameters == null) {
        print("_sendDeleteRequest onSuccess called [1]");
        response = await _dio.delete(url, queryParameters: queryParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        print("_sendDeleteRequest onSuccess called [2]");
        response = await _dio.delete(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
        print("_sendDeleteRequest onSuccess called [3]");
        response = await _dio.delete(url, data: bodyParameters);
      }

      if (response.statusCode == 200) {
        logger.e("_sendDeleteRequest onSuccess----> Of Url $url " +
            response.toString());
        if (response.data != null) {
          onSuccess(response.data);
        } else {
          onSuccess("Success");
        }
      } else {
        logger.e("_sendDeleteRequest onError----> Of Url $url " +
            response.toString());
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
      queryParameters,
      bodyParameters}) async {
    print("submitNewAddress ----> " + bodyParameters.toString());
    try {
      Response response;
      if (queryParameters != null && bodyParameters == null) {
        print("_sendPostRequest onSuccess called [1]");
        response = await _dio.post(url, queryParameters: queryParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        print("_sendPostRequest onSuccess called [2]");
        response = await _dio.post(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
        print("_sendPostRequest onSuccess called [3]");
        response = await _dio.post(url, data: bodyParameters);
      }

      if (response.statusCode == 200) {
        logger.e("_sendPostRequest onSuccess----> Of Url $url " +
            response.toString());
        if (response.data != null) {
          onSuccess(response.data);
        } else {
          onSuccess("Success");
        }
      } else {
        logger.e(
            "_sendPostRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  _sendPutRequest(
      {Function onSuccess(data),
      Function onError(data),
      String url,
      queryParameters,
      bodyParameters}) async {
    print("bodyParameters --->" + bodyParameters.toString());
    try {
      Response response;
      if (queryParameters != null && bodyParameters == null) {
        print("_sendPutRequest onSuccess called [1]");
        response = await _dio.put(url, queryParameters: queryParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        print("_sendPutRequest onSuccess called [2]");
        response = await _dio.put(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
        print("_sendPutRequest onSuccess called [3]");
        response = await _dio.put(url, data: bodyParameters);
      }

      if (response.statusCode == 200) {
        logger.e("_sendPostRequest onSuccess----> Of Url $url " +
            response.toString());
        if (response.data != null) {
          onSuccess(response.data);
        } else {
          onSuccess("Success");
        }
      } else {
        logger.e(
            "_sendPutRequest onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  handleDioErrorResponse(url, DioError e, onError) {
    ErrorResponse errorResponse;
    try {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.

      if (e.response != null) {
        print("handleDioErrorResponse() ---> Bad Response (" +
            e?.response?.request?.uri.toString() +
            ")(" +
            e?.response?.statusCode?.toString() +
            ")");

        if (e?.response?.statusCode == 500) {
          onError("Un Expected Error");
        } else if (e?.response?.statusCode == 406) {
          errorResponse = ErrorResponse.fromJson(e.response.data);

          onError(errorResponse);
        } else if (e?.response?.statusCode == 401) {
          onError(S.current.invalidLogin);
        } else {
          onError(" UnExpected Error");
        }
      } else {
        onError(e?.response ?? " UnExpected Error");
      }
    } catch (e) {
      onError("Un Expected Error");
    }
  }
}

// class ErrorResponse {
//   String fixJidErrorDetails;
//   String fixJidErrorCode;
//
//   ErrorResponse({this.fixJidErrorDetails, this.fixJidErrorCode});
//
//   factory ErrorResponse.fromJson(Map<String, dynamic> json) {
//     try {
//       return ErrorResponse(
//           fixJidErrorDetails: json['optique_error_details'][0],
//           fixJidErrorCode: json['optique_error_code'][0]);
//     } catch (e) {
//       return ErrorResponse(
//           fixJidErrorDetails: "Un parsed Error", fixJidErrorCode: "0");
//     }
//   }
// }
