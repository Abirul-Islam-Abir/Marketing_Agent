import 'package:amin_agent/app/api%20services/targets/all_targets.dart';
import 'package:amin_agent/app/data/const/export.dart';


class AllTargetsScreenController extends GetxController {
  final ScrollController scrollController = ScrollController();
  bool _isProgress = true;

  bool get isProgress => _isProgress;
  bool _moreLoading = false;

  bool get moreLoading => _moreLoading;
  List _allTargetDataList = [];

  List get allTargetDataList => _allTargetDataList;
  int currentPage = 1;

  Future<void> allTargetData({date,page}) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await allTargetDataRequest(token: token, page: page,date: date);
       if (response['success'] == true) {
        _allTargetDataList = allTargetDataList + response['data']['targets'];

      }
    }
  }

  void progress(v) {
    _isProgress = v;

    update();
  }
bool _isFilter = false;
  bool get isFilter=>_isFilter;
void isFilterTap(v){
  _isFilter= v;
  update();
}
  void moreLoad(v) {
    _moreLoading = v;
    update();
  }

  Future<void> initializeMethod({date,page}) async {

     moreLoad(true);
    try {
      await Future.wait([
        allTargetData(date:date,page:page),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
       progress(false);
       moreLoad(false);
    }
  }

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        currentPage++;
        isFilter?  initializeMethod(date:joinedSelectedDates,page: currentPage):initializeMethod(date:joinedDates,page: currentPage);
      }
    });
    initializeMethod(date:joinedDates,page:joinedDates);

    super.onInit();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}