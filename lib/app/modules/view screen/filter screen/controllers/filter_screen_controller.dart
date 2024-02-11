import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/utils/method.dart';
import '../../../../model/category_model.dart';

class FilterScreenController extends GetxController {
  bool isSelected = false;
  RxInt selectedIndex = 0.obs;
  String category = '';

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
  final List<User>? selectedUserList = [];
  int? selectedUserIndex;

  void onDateChange(List<DateTime?> dates) {
    selectedRangeDate = List<DateTime?>.from(dates);
    formattedDates = selectedRangeDate
        .map((date) => DateFormat('yyyy-MM-dd').format(date!))
        .toList();
    // Joining formatted dates with "/"
    joinedSelectedDates = formattedDates.join('/');
   }

  void selectedChangeIndex(index) {
    selectedUserIndex = isSelected ? null : index;
    update();
  }

  void selectDateFilter() {
    selectedIndex.value = 0;
  }

  void selectCategoryFilter() {
    selectedIndex.value = 1;
  }

  void setCategory() {
    print(joinedSelectedDates); // Output: 2024-02-05/2024-02-07
  }
}