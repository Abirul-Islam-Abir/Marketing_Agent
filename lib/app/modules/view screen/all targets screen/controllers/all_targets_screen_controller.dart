import 'package:amin_agent/app/api%20services/targets/all_targets.dart';
import 'package:amin_agent/app/data/const/export.dart';

import '../../../../data/utils/user_data_key.dart';

class AllTargetsScreenController extends GetxController {
  final ScrollController scrollController = ScrollController();
  bool _isProgress = true;

  bool get isProgress => _isProgress;
  bool _moreLoading = false;

  bool get moreLoading => _moreLoading;
  List _allTargetDataList = [];

  List get allTargetDataList => _allTargetDataList;
  int currentPage = 1;

  Future<void> allTargetData(page) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await allTargetDataRequest(token: token, page: page);
      print(response);
      if (response['success'] == true) {
        _allTargetDataList = allTargetDataList + response['data']['targets'];
      }
    }
  }

  void progress(v) {
    _isProgress = v;
    _moreLoading = v;
    update();
  }



  Future<void> initializeMethod(page) async {
     progress(true);
    try {
      await Future.wait([
        allTargetData(page),
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
        currentPage++;
        initializeMethod(currentPage);
      }
    });
    initializeMethod(currentPage);
    super.onInit();
  }
}