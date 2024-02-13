import 'package:amin_agent/app/api%20services/doctor/target_wise_doctor.dart';
import 'package:amin_agent/app/data/utils/method.dart';
import 'package:get/get.dart';

import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class TargetWiseDoctorVisitedController extends GetxController {
  // ID obtained from arguments
  final id = Get.arguments;

  // Variable to track if a progress operation is ongoing
  bool _isProgress = false;

  // Getter for accessing the progress status
  bool get isProgress => _isProgress;

  // List to store target-wise doctor visited data
  List _targetWiseDoctorVisitedList = [];

  // Getter for accessing the list of target-wise doctor visited data
  List get targetWiseDoctorVisitedList => _targetWiseDoctorVisitedList;

  // Method to fetch target-wise doctor visited data
  Future targetWiseDoctorVisited(date) async {
    // Retrieve user authentication token
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      // Call API to fetch target-wise doctor visited data
      final response = await targetWiseDoctorRequest(token: token, id: id, date: date);
      if (response['success'] == true) {
        // Update the list of target-wise doctor visited data
        _targetWiseDoctorVisitedList = response['data'];
      }
    }
  }

  // Method to update progress status
  void progress(v) {
    _isProgress = v;
    update();
  }

  // Method to initialize the controller
  Future<void> initializeMethod(date) async {
    // Set progress to true indicating an operation is ongoing
    progress(true);
    try {
      // Fetch target-wise doctor visited data
      await Future.wait([
        targetWiseDoctorVisited(date),
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