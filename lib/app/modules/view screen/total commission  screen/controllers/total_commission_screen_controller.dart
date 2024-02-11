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
  bool selectDateWise = false;

  Future<void> salesAndCommission({date, page}) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await salesAndCommissionRequest(
          token: token, date: date, id: id, page: page);
      print(response);
      if (response['success'] == true) {
        _salesAndCommissionList = response['data']['sales_and_commissions'];
      }
    }
  }

  void progress(v) {
    _isProgress = v;
    update();
  }

  Future<void> initializeMethod({date, page}) async {
    progress(true);
    try {
      await Future.wait([
        salesAndCommission(date: date, page: page),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      progress(false);
    }
  }

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // print(paginationData['data']['next_page_url'].toString());
        currentPage++;
        initializeMethod(date:joinedDates, page: currentPage);
      }
    });
    initializeMethod(date:joinedDates, page: currentPage);
    super.onInit();
  }
}