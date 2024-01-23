import 'package:amin_agent/app/data/const/export.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import '../../../../api services/auth/update_profile.dart';
import '../../../../api services/auth/upload_avatar.dart';
import '../../../../api services/auth/user_profile.dart';
import '../../../../data/utils/user_data_key.dart';

class ProfileScreenController extends GetxController {
  //Select index
  int selectedIndex = 0;

  //isLoading update button
  //Using update screen
  final RxBool _isProgress = false.obs;
  //uploadedAvatar using profile screen
  bool _isUploadedAvatar = false;

  bool get isProgress => _isProgress.value;
  bool get isUploadedAvatar => _isUploadedAvatar;

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
        //When upload pdf in profile details screen after updating widget for view pdf
        update();
      }
    }
  }

/*
* When user come dashboard after calling userProfileInitializeMethod() method automatically
* */
  Future<void> userProfileInitializeMethod() async {
    _isProgress.value = true;
    update();
    try {
      await Future.wait([
        userProfile(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
      if (userProfileList.isEmpty) {
        Get.find<DashboardScreenController>().logout();
      }
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
        await userProfile();
        update();
        Get.back();
        _isProgress.value = false;
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
    Get.back();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      _isUploadedAvatar = true;
      update();
    });
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      if (pickedFile != null) {
        final token = await box.read(UserDataKey.tokenKey);
        if (token != null) {
          // Compress the image before uploading
          final compressedImage = await compressImage(pickedFile.path);
          final response = await uploadImageRequest(
            path: compressedImage.path,
            token: token,
          );
          if (response['success'] == true) {
            await userProfile();
          } else {
            _isUploadedAvatar = false;
            update();
          }
        }
      } else {
        _isUploadedAvatar = false;
        update();
      }
    } on PlatformException {
      return;
    } finally {
      _isUploadedAvatar = false;
      update();
    }
  }

  Future<PickedFile> compressImage(String imagePath) async {
    final File imageFile = File(imagePath);
    final img.Image? originalImage =
        img.decodeImage(imageFile.readAsBytesSync());

    // You can adjust the compression quality and dimensions as needed
    final img.Image compressedImage = img.copyResize(originalImage!,
        width: 800, height: 600, interpolation: img.Interpolation.linear);

    final Uint8List compressedBytes =
        img.encodeJpg(compressedImage, quality: 85);

    final String compressedImagePath =
        "${imageFile.parent.path}/compressed_${imageFile.uri.pathSegments.last}";
    await File(compressedImagePath).writeAsBytes(compressedBytes);

    return PickedFile(compressedImagePath);
  }

  @override
  void onInit() {
    userProfileInitializeMethod();
    super.onInit();
  }
}
