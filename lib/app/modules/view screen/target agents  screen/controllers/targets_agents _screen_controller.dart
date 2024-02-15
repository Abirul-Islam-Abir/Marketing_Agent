
import '../../../../api services/agents/all_agents.dart';
import '../../../../data/const/export.dart';

class AgentsScreenController extends GetxController {
  // Variable to track if a progress operation is ongoing
  bool _isProgress = false;

  // Getter for accessing the progress status
  bool get isProgress => _isProgress;

  // List to store all target agents
  List _allTargetAgentsList = [];

  // Getter for accessing the list of all target agents
  List get allTargetAgentsList => _allTargetAgentsList;

  // Map to store data related to all target agents for app bar
  Map<String, dynamic> _allTargetsAgentAppbar = {};

  // Getter for accessing the data related to all target agents for app bar
  Map<String, dynamic> get allTargetsAgentAppbar => _allTargetsAgentAppbar;

  // Target ID obtained from arguments
  final targetId = Get.arguments;

  // Method to fetch all target agents data
  Future<void> allTargetsAgents() async {
    // Retrieve user authentication token
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      // Call API to fetch data of all agents for a target
      final response = await allAgentsDataRequest(token: token, id: targetId);
      if (response['success'] == true) {
        // Clear the existing data related to all target agents for app bar
        _allTargetsAgentAppbar.clear();
        // Update data related to all target agents for app bar
        _allTargetsAgentAppbar = response['data'];
        // Update the list of all target agents
        _allTargetAgentsList = response['data']['agents'];
      }
    }
  }

  // Method to update progress status
  void progress(v) {
    _isProgress = v;
    update();
  }

  // Method to initialize the controller
  Future<void> initializeMethod() async {
    // Set progress to true indicating an operation is ongoing
    progress(true);
    try {
      // Fetch data of all target agents
      await Future.wait([
        allTargetsAgents(),
      ]);
    } catch (e) {
      // Throw an exception if an error occurs during initialization
      throw Exception('$e');
    } finally {
      // Set progress to false indicating operation completion
      progress(false);
    }
  }

  // Called when the controller is initialized
  @override
  void onInit() {
    // Initialize the controller
    initializeMethod();
    super.onInit();
  }
}