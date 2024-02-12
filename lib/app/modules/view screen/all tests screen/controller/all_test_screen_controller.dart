import 'package:amin_agent/app/api%20services/tests/all_test.dart';
import 'package:get/get.dart';

import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class AllTestScreenController extends GetxController {
  final id = Get.arguments;
  bool _isProgress = false;

  bool get isProgress => _isProgress;
  List _allTestList = [];

  List get allTestList => _allTestList;
  Future<void> allTestData() async {

    final token = await box.read(UserDataKey.tokenKey);
     if (token != null && id != null) {
      final response = await allTestRequest(token: token, id: id);
      if (response['success'] == true) {
         _allTestList = response['data'];
      }
    }
  }
  void progress(v){
    _isProgress = v;
    update();
  }

  Future<void> initializeMethod() async {
    progress(true);
    try {
      await Future.wait([
        allTestData(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      progress(false);
    }
  }

  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }
}