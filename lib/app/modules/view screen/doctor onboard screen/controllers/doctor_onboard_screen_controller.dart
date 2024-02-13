import 'package:amin_agent/app/data/utils/method.dart';
import 'package:get/get.dart';

import '../../../../api services/doctor/doctor_onboard.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class DoctorOnboardScreenController extends GetxController {
  // Variable to track if a progress operation is ongoing
  bool _isProgress = false;

  // Getter for accessing the progress status
  bool get isProgress => _isProgress;

  // Lists to store doctor onboard and visited lists
  List _doctorOnboardList = [];
  List _doctorVisitedList = [];

  // Getters for accessing the doctor onboard and visited lists
  List get doctorOnboardList => _doctorOnboardList;
  List get doctorVisitedList => _doctorVisitedList;

  // Method to fetch doctor onboard and visited data
  Future doctorOnboard(date) async {
    // Retrieve authentication token
    final token = await box.read(UserDataKey.tokenKey);

    if (token != null) {
      // Fetch doctor onboard data from the server
      final response = await doctorOnboardDataRequest(token: token, date: date);
      if (response['success'] == true) {
        // Update doctor onboard and visited lists with the fetched data
        _doctorOnboardList = response['data']['onboard_doctor'];
        _doctorVisitedList = response['data']['visited_doctor'];
      }
    }
  }

  // Method to update progress status
  void progress(v) {
    _isProgress = v;
    // Trigger update to reflect changes in the UI
    update();
  }

  // Method to initialize the controller
  Future<void> initializeMethod(date) async {
    // Set progress to true indicating an operation is ongoing
    progress(true);
    try {
      // Fetch doctor onboard data
      await Future.wait([
        doctorOnboard(date),
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
    // Initialize the controller with the provided date
    initializeMethod(joinedDates);
    super.onInit();
  }
}