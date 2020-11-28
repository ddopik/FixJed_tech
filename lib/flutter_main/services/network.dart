import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiHelper {
  final String _BASE_URL = "";

  Future<dynamic> getAsync(String endPoint) async {
    var url = _BASE_URL + endPoint;
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<dynamic> postAsync(String endPoint, Map data) async {
    var url = _BASE_URL + endPoint;

    var client = http.Client();
    var request = http.Request('POST', Uri.parse(url));
    request.headers[HttpHeaders.contentTypeHeader] =
        'application/json; charset=utf-8';
    request.headers[HttpHeaders.cacheControlHeader] = "no-cache";
    request.body = json.encode(data);
    var response =
        await client.send(request).then((res) => res.stream.bytesToString());
//    await client.post(url, body: request.body).toString();
    var dataResponse = await json.decode(response);
    return dataResponse;
  }

  // Future<List<Product>> getProducts() async {
  //   //##<07>## not in use
  //   try {
  //     var response = await getAsync("products");
  //     List<Product> list = [];
  //     if (response is Map && isNotBlank(response["message"])) {
  //       throw Exception(response["message"]);
  //     } else {
  //       for (var item in response) {
  //         list.add(Product.fromJson(item));
  //       }
  //       return list;
  //     }
  //   } catch (e) {
  //     // todo try to pares the response if it matched with a the uniformed Error object of server  return it  Else through Glopal exception
  //     //
  //     //This error exception is about your Rest API is not config correctly so that not return the correct JSON format, please double check the document from this link https://docs.inspireui.com/fluxstore/woocommerce-setup/
  //     rethrow;
  //   }
  // }

  // Future updateOrder(orderId, {status, token}) async {
  //   try {
  //     var response = await wcApi
  //         .postAsync("orders/$orderId", {"status": status}, version: 2);
  //     if (response["message"] != null) {
  //       throw Exception(response["message"]);
  //     } else {
  //       return Order.fromJson(response);
  //     }
  //   } catch (e) {
  //     //This error exception is about your Rest API is not config correctly so that not return the correct JSON format, please double check the document from this link https://docs.inspireui.com/fluxstore/woocommerce-setup/
  //     rethrow;
  //   }
  // }

}
