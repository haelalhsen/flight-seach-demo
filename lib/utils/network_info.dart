// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

// class NetworkInfoImpl implements NetworkInfo {
//   final InternetConnectionChecker connectionChecker;
//
//   NetworkInfoImpl(this.connectionChecker);
//   @override
//   Future<bool> get isConnected => connectionChecker.hasConnection;
// }

class NetworkInfoWithConnectivity implements NetworkInfo{
  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
  @override
  Future<bool> get isConnected => checkInternetConnection();

}
