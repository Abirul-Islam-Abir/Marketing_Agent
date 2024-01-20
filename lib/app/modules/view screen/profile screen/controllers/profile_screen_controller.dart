import 'package:amin_agent/app/data/const/export.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api services/auth/update_profile.dart';
import '../../../../api services/auth/upload_avatar.dart';
import '../../../../api services/auth/user_profile.dart';
import '../../../../data/utils/user_data_key.dart';
import '../views/profile_details_screen.dart';

class ProfileScreenController extends GetxController {
  //Select index
  int selectedIndex = 0;

  //isLoading update button
  final RxBool _isProgress = false.obs;

  bool get isProgress => _isProgress.value;

  //Store my user profile data here
  Map<String, dynamic> _userProfileList = {};

  Map<String, dynamic> get userProfileList => _userProfileList;

  /*
  * TextEditingController all
  * using profile edit screen
  * */
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController certificationController = TextEditingController();
  final TextEditingController passportController = TextEditingController();

  /*
 * User Data get method
 * user edit screen form field all set data in field
 * */
  Future userProfile() async {
    final token = await box.read(UserDataKey.tokenKey);

    if (token != null) {
      final response = await userProfileRequest(token);
      if (response['success'] == true) {
        _userProfileList = response['data']['user'];
        nameController.text = '${userProfileList['name']}';
        numberController.text = '${userProfileList['phone']}';
        designationController.text = '${userProfileList['designation']}';
        nidController.text = '${userProfileList['nid']}';
        addressController.text = ' ${userProfileList['address']}';
        passportController.text = ' ${userProfileList['passport']}';
      }
    }
  }

/*
* When user come dashboard after calling userProfileInitializeMethod() method automatically
* */
  Future<void> userProfileInitializeMethod() async {
    _userProfileList.clear();
    try {
      await Future.wait([
        userProfile(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      _isProgress.value = false;
      update();
    }
  }

/*
* User profile edit post method
* if data is updated after going  ProfileDetailsScreen()
* */
  Future<void> userProfileEdit() async {
    _isProgress.value = true;
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await updateProfileRequest(
          token: token,
          name: nameController.text,
          designation: designationController.text,
          nid: nidController.text,
          address: addressController.text,
          certification: certificationController.text,
          passport: passportController.text);
      if (response['success'] == true) {
        await userProfileInitializeMethod();
        Get.to(() => ProfileDetailsScreen());
      } else {
        _isProgress.value = false;
      }
    }
  }

/*
* Get images from camera or gallery and set image and image path
* working profile image edit
* */

  Future<void> getImage(imageSource) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);

      if (pickedFile != null) {
        final token = await box.read(UserDataKey.tokenKey);
        if (token != null) {
          final response =
              await uploadImageRequest(path: pickedFile.path, token: token);
          await userProfileInitializeMethod();
          if (response['success'] == true) {
            Get.back();
          }
        }
      }
    } on PlatformException {
      return;
    }
  }

  @override
  void onInit() {
    userProfileInitializeMethod();
    super.onInit();
  }
}
