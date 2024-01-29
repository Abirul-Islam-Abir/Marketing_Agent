// ignore_for_file: file_names

import '../../../../api services/agents/all_agents.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';

class AgentsScreenController extends GetxController {
  bool _isProgress = false;
  bool get isProgress => _isProgress;
  Map<String, dynamic> _allTargetsAgentsList = {};
  Map<String, dynamic> get allTargetsAgentsList => _allTargetsAgentsList;

  Future<void> allTargetsAgents(id) async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await allAgentsDataRequest(token:token,id: id);
      if (response['success'] == true) {
        _allTargetsAgentsList.clear();
        _allTargetsAgentsList = response['data'];
      }
    }
  }

  Future<void> initializeMethod(id) async {
    _isProgress = true;
    update();
    try {
      await Future.wait([
        allTargetsAgents(id),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress = false;
      update();
    }
  }
}
