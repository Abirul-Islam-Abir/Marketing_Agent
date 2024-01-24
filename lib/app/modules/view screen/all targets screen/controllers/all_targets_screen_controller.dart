import 'package:amin_agent/app/api%20services/dashboard/all_targets.dart';
import 'package:get/get.dart';

import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class AllTargetsScreenController extends GetxController {
  bool _isProgress = true;
  bool get isProgress => _isProgress;
  List _allTargetDataList = [];
  List get allTargetDataList => _allTargetDataList;
  Future<void> allTargetData() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await allTargetDataRequest(token);
      if (response['success'] == true) {
        _allTargetDataList = response['data'];
      }
    }
  }

  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        allTargetData(),
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
  initializeMethod();
    super.onInit();
  }
}
