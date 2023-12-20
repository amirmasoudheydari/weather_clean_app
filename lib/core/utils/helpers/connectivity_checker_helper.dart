import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheckerHelper {
  Future<bool> checkConnectivity() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    return _handelResult(connectivityResult);
  }

  static Stream<ConnectivityResult> listenToConnectivityChanged() {
    return Connectivity().onConnectivityChanged;
  }

  bool _handelResult(ConnectivityResult connectivityResult) {
    final bool connected;

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      connected = true;
    } else {
      connected = false;
    }

    return connected;
  }
}
