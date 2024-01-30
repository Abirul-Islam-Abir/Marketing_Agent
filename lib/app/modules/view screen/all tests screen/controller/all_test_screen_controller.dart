import 'package:amin_agent/app/api%20services/tests/all_test.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class AllTestScreenController extends GetxController {
  bool _isProgress = false;

  bool get isProgress => _isProgress;
  List _allTestList = [];

  List get allTestList => _allTestList;
  Future<void> allTestData() async {
    final token = await box.read(UserDataKey.tokenKey);
    final targetId = await box.read(UserDataKey.currentTargetIdKey);
    print(targetId);
    if (token != null && targetId != null) {
      final response = await allTestRequest(token:token,id: targetId);
      if (response['success'] == true) {
        _allTestList.clear();
        _allTestList = response['data'];
        print(response);
      }
    }
  }
  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        allTestData(),
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