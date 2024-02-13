import '../../../../api services/sales and commission/sales_and_commission.dart';
import '../../../../data/const/export.dart';

class TotalCommissionScreenController extends GetxController {
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

  // Current page of data
  int currentPage = 1;

  // Scroll controller for managing scroll behavior
  ScrollController scrollController = ScrollController();

  // Boolean to determine whether date-wise selection is made
  bool selectDateWise = false;

  // Method to fetch sales and commission data
  Future<void> salesAndCommission({date, page}) async {
    // Retrieve user authentication token
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      // Call API to fetch sales and commission data
      final response = await salesAndCommissionRequest(token: token, date: date, page: page);
      if (response['success'] == true) {
        // Update the list of sales and commission data
        _salesAndCommissionList = response['data']['sales_and_commissions'];
      }
    }
  }

  // Method to update progress status
  void progress(v) {
    _isProgress = v;
    update();
  }

  // Method to initialize the controller
  Future<void> initializeMethod({date, page}) async {
    // Set progress to true indicating an operation is ongoing
    progress(true);
    try {
      // Fetch sales and commission data
      await Future.wait([
        salesAndCommission(date: date, page: page),
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
    // Add listener to the scroll controller to implement pagination
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        // Increment current page when reaching the bottom of the list
        currentPage++;
        // Initialize the controller with the updated page and joinedDates
        initializeMethod(date: joinedDates, page: currentPage);
      }
    });
    // Initialize the controller with the default date and current page
    initializeMethod(date: joinedDates, page: currentPage);
    super.onInit();
  }
}