import 'package:get/get.dart';

import '../../../../api services/sales and commission/sales_and_commission.dart';
import '../../../../data/utils/method.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class TotalSalesScreenController extends GetxController {
  final id = Get.arguments;
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  List _salesAndCommissionList = [];
  List get salesAndCommissionList => _salesAndCommissionList;

  Future<void> salesAndCommission(date) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null ) {
      final response = await salesAndCommissionRequest(token: token,date:date, id: id);
       if (response['success'] == true) {
        _salesAndCommissionList = response['data']['sales_and_commissions'];
      }
    }
  }

  Future<void> initializeMethod(date) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        salesAndCommission(date),
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
    initializeMethod(joinedDates);
    super.onInit();
  }
}