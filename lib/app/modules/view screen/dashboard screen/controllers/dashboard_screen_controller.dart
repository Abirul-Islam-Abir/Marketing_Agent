import 'package:amin_agent/app/api%20services/auth/dashboard/dashboard_data.dart';
import 'package:get/get.dart';

import '../../../../api services/auth/log_out.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../../routes/app_pages.dart';

class DashboardScreenController extends GetxController {
  String text = 'Total commission';
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  Map<String, dynamic> _dashboardDataList = {};
  Map<String, dynamic> get dashboardDataList => _dashboardDataList;
  Future<void> logout() async {
    box.erase();
    Get.offAllNamed(RouteName.loginScreen);
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await logOutRequest(token);
      if (response['success'] == true) {
        box.erase();
        Get.offAllNamed(RouteName.loginScreen);
      }
    }
  }

  Future<void> dashboardData() async {
    final token = await box.read(UserDataKey.tokenKey);
    print(token);
    if (token != null) {
      final response = await dashboardDataRequest(token);
      if (response['success'] == true) {
        _dashboardDataList = response['data']['current_target'];
        print('${response['data']['current_target']}');
      }
    }
  }

  Future<void> userProfileInitializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        dashboardData(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }

  @override
  void onInit() {
    userProfileInitializeMethod();
    super.onInit();
  }
}

class SalesTargetModel {
  final String title;
  final int agentsCount;
  final String targetAmount;
  final String amountCollected;
  final int doctorVisited;
  final int doctorOnboard;

  SalesTargetModel(this.title, this.agentsCount, this.targetAmount,
      this.amountCollected, this.doctorVisited, this.doctorOnboard);
}
