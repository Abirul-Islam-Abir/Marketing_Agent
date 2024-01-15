import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../model/category_model.dart';

class FilterScreenController extends GetxController {
  List<String> formattedDates = [];
  bool isSelected = false;
  RxInt selectedIndex = 0.obs;
  String category = '';
  List<DateTime?> selectedDates = [
    DateTime.now(),
  ];
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
  onDateChange(dates) {
    selectedDates = List<DateTime?>.from(dates);
    formattedDates = selectedDates
        .map((date) => DateFormat('yyyy-MM-dd').format(date!))
        .toList();
  }
  selectedChangeIndex (index) {
    selectedUserIndex =
    isSelected ? null : index;
    update();
  }
  selectDateFilter(){
       selectedIndex.value = 0;

  }
  selectCategoryFilter(){
    selectedIndex.value = 1;
  }
  setCategory(){
  }
}
