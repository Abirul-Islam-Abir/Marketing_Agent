import 'package:get/get.dart';

import '../../../../api services/sales and commission/sales_and_commission.dart';
import '../../../../data/utils/method.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';
class TotalSalesScreenController extends GetxController {
  // ID obtained from arguments
  final id = Get.arguments;

  // Variable to track if a progress operation is ongoing
  bool _isProgress = false;

  // Getter for accessing the progress status
  bool get isProgress => _isProgress;

  // List to store sales and commission data
  List _salesAndCommissionList = [];

  // Getter for accessing the list of sales and commission data
  List get salesAndCommissionList => _salesAndCommissionList;

  // Method to fetch sales and commission data
  Future<void> salesAndCommission(date) async {
    // Retrieve user authentication token
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      // Call API to fetch sales and commission data for the specified date
      final response = await salesAndCommissionRequest(token: token, date: date);
      if (response['success'] == true) {
        // Update the list of sales and commission data
        _salesAndCommissionList = response['data']['sales_and_commissions'];
      }
    }
  }

  // Method to initialize the controller
  Future<void> initializeMethod(date) async {
    // Set progress to true indicating an operation is ongoing
    _isProgress = true;
    update();
    try {
      // Fetch sales and commission data
      await Future.wait([
        salesAndCommission(date),
      ]);
    } catch (e) {
      // Throw an exception if an error occurs during initialization
      throw Exception('$e');
    } finally {
      // Set progress to false indicating operation completion
      _isProgress = false;
      update();
    }
  }

  // Called when the controller is initialized
  @override
  void onInit() {
    // Initialize the controller with the default date
    initializeMethod(joinedDates);
    super.onInit();
  }
}