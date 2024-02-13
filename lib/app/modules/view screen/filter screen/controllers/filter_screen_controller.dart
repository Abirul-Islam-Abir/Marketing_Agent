import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/utils/method.dart';
import '../../../../model/category_model.dart';
class FilterScreenController extends GetxController {
  // Indicates whether an item is selected
  bool isSelected = false;

  // Reactive integer for tracking the selected index
  RxInt selectedIndex = 0.obs;

  // Selected category
  String category = '';

  // List of users with different categories
  List<User> userList = [
    User(name: "All category"),
    User(name: "Pathology "),
    User(name: "Ultrasonography "),
    User(name: "X-Ray "),
    User(name: "ECG "),
    User(name: "ECHO "),
    User(name: "FNAC "),
    User(name: "END/COM  "),
    User(name: "EEG "),
    User(name: "HISTO  "),
  ];

  // List to store selected users
  final List<User>? selectedUserList = [];

  // Index of the selected user
  int? selectedUserIndex;

  // Method to handle date change
  void onDateChange(List<DateTime?> dates) {
    // Update selected date range and format dates
    selectedRangeDate = List<DateTime?>.from(dates);
    formattedDates = selectedRangeDate
        .map((date) => DateFormat('yyyy-MM-dd').format(date!))
        .toList();
    // Join formatted dates with "/"
    joinedSelectedDates = formattedDates.join('/');
  }

  // Method to handle selection change
  void selectedChangeIndex(index) {
    // Toggle selected index based on current state
    selectedUserIndex = isSelected ? null : index;
    update();
  }

  // Method to select date filter
  void selectDateFilter() {
    selectedIndex.value = 0;
  }

  // Method to select category filter
  void selectCategoryFilter() {
    selectedIndex.value = 1;
  }
}