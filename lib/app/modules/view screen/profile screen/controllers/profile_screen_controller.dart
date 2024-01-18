import 'package:amin_agent/app/data/const/export.dart';

import '../../../../api services/auth/user_profile.dart';
import '../../../../data/utils/user_data_key.dart';

class ProfileScreenController extends GetxController {
  int selectedIndex = 0;
  final RxBool _isProgress = false.obs;
  bool get isProgress => _isProgress.value;
  Map<String, dynamic> _userProfileList = {}; // Specify the type of the map
  Map<String, dynamic> get userProfileList => _userProfileList;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController addressController = TextEditingController();


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
    print(token);
    final headerWithToken = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (token != null) {
      final response = await userProfileRequest(headerWithToken);
      print(response);
      if (response['success'] == true) {
        _userProfileList = response['data']['user'];
        nameController.text = '${userProfileList['name']}';
        numberController.text = '${userProfileList['phone']}';
        designationController.text = '${userProfileList['designation']}';
        companyController.text = 'Amin Diagnostic';
        nidController.text = '${userProfileList['nid']}';
        addressController.text = ' ${userProfileList['address']}';

      }
    }
  }
//
  Future<void> userProfileInitializeMethod() async {
    try {
      await Future.wait([
        userProfile(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress.value = false;
    }
  }

  @override
  void onInit() {
    userProfileInitializeMethod();
    super.onInit();
  }
}
