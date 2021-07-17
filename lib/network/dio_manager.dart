import 'package:dio/dio.dart';
import 'package:flutter_base_app/flutter_main/common/constants.dart';
import 'package:flutter_base_app/flutter_main/common/model/ErrorResponse.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/screens/login/model/loginResponse.dart';
import 'package:flutter_base_app/flutter_main/storage/pref_manager.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class DIOManager {
  static final DIOManager _instance = DIOManager._dio();

  factory DIOManager() {
    return _instance;
  }

  DIOManager._dio();

  Dio get _dio {
    final Dio dio = Dio();

    dio.options.baseUrl = "http://34.193.99.151:8080/fix-jed-back-end";
    dio.options.headers = {
      "Accept-Language": currentLanguage,
      "Authorization":
          "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhaG1lZC5tb2hhbWVkQGdtYWlsLmNvbSIsImF1dGhvcml0aWVzIjpbeyJhdXRob3JpdHkiOiJUZWNobmljaWFuIFJvbGUifSx7ImF1dGhvcml0eSI6ImZpbmRBbGxUZWNobmljaWFuQ29uZmlybWVkU3RhdHVzIn0seyJhdXRob3JpdHkiOiJjaGFuZ2VUb1RlY2huaWNpYW5VcGNvbWluZ0NhbmNlbFN0YXR1cyJ9LHsiYXV0aG9yaXR5Ijoic3RhcnRUZWNobmljaWFuVHJhbnNhY3Rpb24ifSx7ImF1dGhvcml0eSI6ImNoYW5nZVRvVGVjaG5pY2lhbkRlbGl2ZXJlZFN0YXR1cyJ9LHsiYXV0aG9yaXR5IjoiZmluZEJ5VGVjaG5pY2lhblRyYW5zYWN0aW9uSWQifSx7ImF1dGhvcml0eSI6ImZpbmRBbGxUZWNobmljaWFuRGVsaXZlcmVkU3RhdHVzIn1dLCJpYXQiOjE2MjM2NzgyNzgsImV4cCI6MTYyNDgzODQwMH0.kkycwNvwn613J74mQHJpMr5X6_2Ug2WFcVaMprGI9-o1Ud7qGvn5HgI5pMs89KXY7U7S9vRdNkTDp0VpngaYCQ",
    };

    // _instance._dio.interceptors.add(DioCacheManager(
    //     CacheConfig(baseUrl: "http://34.193.99.151:8080/fix-jed-back-end/"))
    //     .interceptor);

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
  static const String _GET_TRANSACTION_INFO = "/technicians/";
  static const String _ACCEPT_TRANSACTION =
      "/technicians/start-technician-transaction";

  static const String _END_TRANSACTION =
      "/technicians/change-to-delivered-status";
  static const String _DECLINE_TRANSACTION =
      "/technicians/change-to-assigned_cancel-status";
  static const String _ACCEPT_INCOMING_TRANSACTION =
      "/technicians/change-to-confirmed-status";

  static const String _GET_APPROVED_REQUESTS =
      "/technicians/find-all-confirmed-status";
  static const String _GET_INCOMING_TRANSACTION =
      "/technicians/find-all-pending-technician-transactions";
  static const String GET_NOTIFICATION = "/notifications/find-all";
  static const String GET_PAST_ORDERS = "/technicians/find-all-history";

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

  getApprovedTransaction({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      // url: _GET_APPROVED_TRANSACTION,
    );
  }

  getInComingTransaction({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: _GET_INCOMING_TRANSACTION,
    );
  }

  acceptTransaction({transactionId, Function onSuccess, Function onError}) {
    _sendPatchRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _ACCEPT_TRANSACTION + "/$transactionId",
        queryParameters: null);
  }

  endTransaction({transactionId, Function onSuccess, Function onError}) {
    _sendPatchRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _END_TRANSACTION + "/$transactionId",
        queryParameters: null);
  }

  declineIncomingTransaction(
      {transactionId,
      reasonId,
      String reasonDesc,
      Function onSuccess,
      Function onError}) {
    String reasonIdVal;

    switch (reasonId) {
      case AssignedCancelReason.SHIFT_END:
        {
          reasonIdVal = "SHIFT_END";
          break;
        }
      case AssignedCancelReason.INCORRECT_INFO:
        {
          reasonIdVal = "INCORRECT_INFO";
          break;
        }
      case AssignedCancelReason.VACATION:
        {
          reasonIdVal = "VACATION";
          break;
        }
      case AssignedCancelReason.ADDRESS_MISMATCH:
        {
          reasonIdVal = "ADDRESS_MISMATCH";
          break;
        }
      case AssignedCancelReason.OUTDATED:
        {
          reasonIdVal = "OUTDATED";
          break;
        }
    }

    _sendPatchRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _DECLINE_TRANSACTION + "/$transactionId",
        bodyParameters: {
          "assignedCancelReason": reasonIdVal,
          "rejectionDescription": reasonDesc
        });
  }

  cancelTransaction({transactionId, Function onSuccess, Function onError}) {
    _sendPatchRequest(
        onSuccess: onSuccess,
        onError: onError,
        // url: _CANCEL_TRANSACTION + "/$transactionId",
        queryParameters: null);
  }

  getRequestInfo({transactionID, Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: _GET_TRANSACTION_INFO + "/$transactionID",
    );
  }

  acceptIncomingTransaction(
      {transactionId, Function onSuccess, Function onError}) {
    _sendPatchRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: _ACCEPT_INCOMING_TRANSACTION + "/$transactionId",
        queryParameters: null);
  }

  submitCancelTransactionReason(
      {Function onSuccess, Function onError, reasonId, transactionId}) {
    _sendPatchRequest(onSuccess: onSuccess, onError: onError,
        //  url: SUBMIT_CANCEL_TRANSACTION_REASON + "/$transactionId",
        bodyParameters: {
          "deliveredCancelReason": reasonId,
          "rejectionDescription": ""
        });
  }

  submitId({Function onSuccess, Function onError, reasonId, transactionId}) {
    print(reasonId);
    _sendPostRequest(
        onSuccess: onSuccess,
        onError: onError,
        url: "_ADD_PRODUCT_TO_CART",
        bodyParameters: reasonId);
  }

  getNotification({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: GET_NOTIFICATION,
    );
  }

  //
  // getNotification({Function onSuccess, Function onError}) {
  //   _sendGetRequest(
  //     onSuccess: onSuccess,
  //     onError: onError,
  //     url: GET_NOTIFICATION,
  //   );
  // }

  getPastOrder({Function onSuccess, Function onError}) {
    _sendGetRequest(
      onSuccess: onSuccess,
      onError: onError,
      url: GET_PAST_ORDERS,
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
        response = await _dio.put(url, queryParameters: queryParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        response = await _dio.put(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
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
        logger.e("statusCode onError----> Of Url $url " + response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  _sendPatchRequest(
      {Function onSuccess(data),
      Function onError(data),
      String url,
      queryParameters,
      bodyParameters}) async {
    print("bodyParameters --->" + bodyParameters.toString());
    try {
      Response response;
      if (queryParameters != null && bodyParameters == null) {
        response = await _dio.patch(url, queryParameters: queryParameters);
      } else if (queryParameters != null && bodyParameters != null) {
        response = await _dio.patch(url,
            data: bodyParameters, queryParameters: queryParameters);
      } else {
        response = await _dio.patch(url, data: bodyParameters);
      }

      if (response.statusCode == 200) {
        logger.e("_sendPatchRequest onSuccess----> Of Url $url " +
            response.toString());
        if (response.data != null) {
          onSuccess(response.data);
        } else {
          onSuccess("Success");
        }
      } else {
        logger.e("_sendPatchRequest onError----> Of Url $url " +
            response.toString());
        onError(response);
      }
    } on DioError catch (e) {
      handleDioErrorResponse(url, e, onError);
    }
  }

  handleDioErrorResponse(url, DioError e, onError) {
    Error errorResponse;
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
          errorResponse = Error.fromJson(e.response.data);
          onError(errorResponse.message);
        } else if (e?.response?.statusCode == 401) {
          onError(S.current.invalidLogin);
        } else {
          onError(S.current.noResultFound);
        }
      } else {
        onError(e?.error?.message ?? "Un Expected Error");
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
