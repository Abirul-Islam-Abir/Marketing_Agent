// ignore_for_file: file_names

import '../../../../api services/agents/all_agents.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';

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

  Future<void> initializeMethod() async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        allTargetsAgents(),
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