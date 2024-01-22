import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../data/const/export.dart';

class NetworkController extends GetxController {
  void showNetworkSnackBar() {
    Get.showSnackbar(const GetSnackBar(
      title: 'No Internet!',
      message: 'Please check your internet connection!',
      isDismissible: false,
      backgroundColor: AppColor.kPrimaryColor,
      showProgressIndicator: true,
    ));
  }

  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  int connectionType = 0;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  @override
  void onInit() {
    super.onInit();
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectionType() async {
    ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException {
      return;
    }
    return _updateState(connectivityResult);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        if (Get.isSnackbarOpen) {
          Get.closeAllSnackbars();
        }

        break;
      case ConnectivityResult.mobile:
        if (Get.isSnackbarOpen) {
          Get.closeAllSnackbars();
        }

        break;
      case ConnectivityResult.none:
        showNetworkSnackBar();

        break;
      default:
        break;
    }
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription.cancel();
  }
}
