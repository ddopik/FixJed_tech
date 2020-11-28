import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:logger/logger.dart';

//**
//use this class to listen for network change and state for critical request
// *//
class MyConnectivity {
  MyConnectivity._internal();
  static final MyConnectivity _instance = MyConnectivity._internal();
  static MyConnectivity get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();
  Stream get myStream => controller.stream;
  bool isShow = false;

  Future<void> initialise() async {
    final result = await connectivity.checkConnectivity();
    await _checkStatus(result);
    connectivity.onConnectivityChanged.listen(_checkStatus);
  }

  Future<void> _checkStatus(ConnectivityResult result) async {
    var isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // ignore: lines_longer_than_80_chars
        Logger(printer: SimplePrinter(colors: true)).v('[MyConnectivity] online');
         isOnline = true;
      } else {
        // ignore: lines_longer_than_80_chars
        Logger(printer: SimplePrinter(colors: true)).v('[MyConnectivity] offline');
        isOnline = false;
      }
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }



  void disposeStream() => controller.close();
}
