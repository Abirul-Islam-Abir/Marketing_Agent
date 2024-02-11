import 'package:amin_agent/app/data/utils/method.dart';
import 'package:get/get.dart';

import '../../../../api services/sales and commission/sales_and_commission.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';


class TotalCommissionScreenController extends GetxController {
  final id = Get.arguments;
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  List _salesAndCommissionList = [];
  List get salesAndCommissionList => _salesAndCommissionList;
  int currentPage = 1;
  ScrollController scrollController = ScrollController();

  Future<void> salesAndCommission(date,page) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null ) {
      final response = await salesAndCommissionRequest(token: token,date:date, id: id,page: page);
      print(response);
      if (response['success'] == true) {
        _salesAndCommissionList = response['data']['sales_and_commissions'];
      }
    }
  }

  Future<void> initializeMethod(date,page) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        salesAndCommission(date,page),
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

     scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // print(paginationData['data']['next_page_url'].toString());
        currentPage++;
        initializeMethod(joinedDates,currentPage);
      }
    });
    super.onInit();
  }
}