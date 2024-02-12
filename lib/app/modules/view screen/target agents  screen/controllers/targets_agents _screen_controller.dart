
import '../../../../api services/agents/all_agents.dart';
import '../../../../data/const/export.dart';

class AgentsScreenController extends GetxController {
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  List _allTargetAgentsList = [];
  List get allTargetAgentsList => _allTargetAgentsList;
  Map<String, dynamic> _allTargetsAgentAppbar = {};
  Map<String, dynamic> get allTargetsAgentAppbar => _allTargetsAgentAppbar;
  final targetId = Get.arguments;

  Future<void> allTargetsAgents() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null ) {
      final response = await allAgentsDataRequest(token: token, id: targetId);
      if (response['success'] == true) {
        _allTargetsAgentAppbar.clear();
        _allTargetsAgentAppbar = response['data'];
        _allTargetAgentsList = response['data']['agents'];
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
        allTargetsAgents(),
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