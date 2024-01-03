import 'package:get/get.dart';

import '../components/show_ct_scan_list.dart';
import '../views/commission_report_screen_view.dart';

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
    if (value == 'Ct scan') {
      showCtScanList(context);
    }
    update();
  }
}
