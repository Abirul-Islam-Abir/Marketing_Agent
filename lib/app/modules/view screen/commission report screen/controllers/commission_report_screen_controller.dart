import 'package:get/get.dart';

import '../components/show_ct_scan_list.dart';

class CommissionReportScreenController extends GetxController {
  final List<String> items = [
    'Patho',
    'Sono',
    'X-ray',
    'Ecg',
    'Echo',
    'Fnac',
    'End/Col',
    'Eeg',
    'Histo',
    'Ct scan'
  ];
  String? selectedValue;
  List<String> ctScanList = ['Ct scan 1', 'Ct scan 2', 'Ct scan 3'];
  void valueUpdate(String? value, context) {
    selectedValue = value;
    update();
    if (value == 'Ct scan') {
      showCtScanList(context);
    }
  }
}
