// ignore_for_file: file_names

import '../../../../api services/agents/all_agents.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';

class AgentsScreenController extends GetxController {
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  Map<String, dynamic> _allTargetsAgentsList = {};
  Map<String, dynamic> get allTargetsAgentsList => _allTargetsAgentsList;

  Future<void> allTargetsAgents() async {
    final token = await box.read(UserDataKey.tokenKey);
    final targetId = await box.read(UserDataKey.currentTargetIdKey);
    if (token != null && targetId != null) {
      final response = await allAgentsDataRequest(token: token, id: targetId);
      if (response['success'] == true) {
        _allTargetsAgentsList.clear();
        _allTargetsAgentsList = response['data'];
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