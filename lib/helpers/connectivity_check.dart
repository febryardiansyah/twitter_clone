import 'package:connectivity/connectivity.dart';

class ConnectivityCheck{
  Future<bool> checkConnection()async{
    var _result = await Connectivity().checkConnectivity();
    return _result == ConnectivityResult.none ? false: true;
  }
}