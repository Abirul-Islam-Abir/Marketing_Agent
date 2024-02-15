import 'package:amin_agent/app/api%20services/targets/all_targets.dart';
import 'package:amin_agent/app/data/const/export.dart';

class AllTargetsScreenController extends GetxController {
  final ScrollController scrollController = ScrollController();
  bool _isProgress = true;

  bool get isProgress => _isProgress;
  bool _moreLoading = false;

  bool get moreLoading => _moreLoading;
  List _allTargetDataList = [];
  Map _nextPageUrl = {};

  Map get nextPageUrl => _nextPageUrl;

  List get allTargetDataList => _allTargetDataList;
  int currentPage = 1;

  Future<void> allTargetData({date, page}) async {
    final token = await box.read(UserDataKey.tokenKey);
    final d = await box.read(UserDataKey.currentTargetIdKey);
    print(token);
    print(d);
    if (token != null) {
      final response =
          await allTargetDataRequest(token: token, page: page, date: date);
      if (response['success'] == true) {
        nextPageUrl.clear();
        _nextPageUrl = response['data'];
        _allTargetDataList = allTargetDataList + response['data']['targets'];
      }
    }
  }

  void progress(v) {
    _isProgress = v;
    update();
  }

  bool _isFilter = false;

  bool get isFilter => _isFilter;

  void isFilterTap(v) {
    _isFilter = v;
    currentPage = 1;
    update();
  }

  void moreLoad(v) {
    _moreLoading = v;
    update();
  }

  Future<void> initializeMethod({date, page}) async {
    moreLoad(true);
    try {
      await Future.wait([
        allTargetData(date: date, page: page),
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
    print(currentPage);
    //first time called this date and method
    initializeMethod(date: joinedDates, page: currentPage);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        //when scroll after call this method
        print(nextPageUrl['next_page_url']);
        currentPage++;
        isFilter
            ? initializeMethod(date: joinedSelectedDates, page: currentPage)
            : initializeMethod(date: joinedDates, page: currentPage);
      }
    });
    super.onInit();
  }
}