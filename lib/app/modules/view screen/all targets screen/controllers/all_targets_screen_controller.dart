import 'package:amin_agent/app/api%20services/targets/all_targets.dart';
import 'package:amin_agent/app/data/const/export.dart';
import 'package:get/get.dart';

import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class AllTargetsScreenController extends GetxController {
  final ScrollController scrollController = ScrollController();
  bool _isProgress = true;
  bool get isProgress => _isProgress;
  bool _moreLoading = false;
  bool get moreLoading => _moreLoading;
  List _allTargetDataList = [];
  List get allTargetDataList => _allTargetDataList;
  int currentPage = 0;
  Future<void> allTargetData() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await allTargetDataRequest(token);
      print(response);
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
  scrollController.addListener(() {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      _moreLoading = true;
      update();
      currentPage++;
      //initializeMethod(currentPage);
      _isProgress = false;
      update();
    }
  });
  initializeMethod();
    super.onInit();
  }
}