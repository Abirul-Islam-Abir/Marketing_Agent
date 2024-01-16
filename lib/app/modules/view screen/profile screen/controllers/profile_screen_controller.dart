import 'package:amin_agent/app/data/const/export.dart';
import 'package:get/get.dart';

import '../../../../api services/auth/user_profile.dart';
import '../../../../data/utils/store_data.dart';
import '../../../../data/utils/user_data_key.dart';

class ProfileScreenController extends GetxController {
  int selectedIndex = 0;
  Map _userProfileList = {};
  Map get userProfileList => _userProfileList;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController= TextEditingController();
  final TextEditingController designationController= TextEditingController();
  final TextEditingController companyController= TextEditingController();
  final TextEditingController nidController= TextEditingController();
  final TextEditingController addressController= TextEditingController();
  void increment() {
    selectedIndex = 1;
    update();
  }

  void decrement() {
    selectedIndex = 0;
    update();
  }

  double progress = 0.0;
  void updateValue(v) {
    progress = v;
    update();
  }

  Future userProfile() async {
    final token = await box.read(UserDataKey.tokenKey);
    final headerWithToken = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Corrected header for Bearer token
    };
    if (token != null) {
      final response = await userProfileRequest(headerWithToken);
      if (response['success'] == true) {
        _userProfileList = response['data']['user'];
      }
    }
  }

  Future<void> userProfileInitializeMethod() async {
    try {
      await Future.wait([
        userProfile(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {}
  }

  @override
  void onInit() {
    userProfileInitializeMethod();
    nameController.text = '${userProfileList['name']}';
    numberController.text = '${userProfileList['number']}';
    designationController.text = '${userProfileList['designation']}';
    companyController.text = '${userProfileList['company']}';
    companyController.text = '${userProfileList['nid']}';
    print('${userProfileList['name']}');
    super.onInit();
  }
}
