import 'package:amin_agent/app/api%20services/shedules/completed_schedules_picture.dart';
import 'package:amin_agent/app/api%20services/targets/completed_targets_visits.dart';
import 'package:amin_agent/app/data/const/export.dart';
 import 'dart:io';
import 'package:image/image.dart' as img;
import '../../../../api services/profile/update_profile.dart';
import '../../../../api services/profile/upload_avatar.dart';
import '../../../../api services/profile/user_profile.dart';

class ProfileScreenController extends GetxController {
  // Track the selected index (Purpose not entirely clear from the provided snippet)
  int selectedIndex = 0;

  // Reactive boolean indicating whether a process is in progress
  bool _isProgress = false;

  bool get isProgress => _isProgress;

  // User profile data fetched from the server
  Map<String, dynamic> _userProfileList = {};
  Map<String, dynamic> _completedTargetVisitList = {};
  List _completedSchedulePictureList = [];

  List get completedSchedulePictureList => _completedSchedulePictureList;

  Map<String, dynamic> get userProfileList => _userProfileList;
  Map<String, dynamic> get completedTargetVisitList => _completedTargetVisitList;
  var selectedImagePath = '';
  // Text editing controllers for various user profile details
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController certificationController = TextEditingController();
  final TextEditingController passportController = TextEditingController();

  // Fetch user profile from the server
  Future userProfile() async {
    final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await userProfileRequest(token);
      if (response['success'] == true) {
        // Populate user profile data and update corresponding text controllers
        _userProfileList = response['data']['user'];
        nameController.text = '${userProfileList['name']}';
        numberController.text = '${userProfileList['phone']}';
        designationController.text = '${userProfileList['designation']}';
        nidController.text = '${userProfileList['nid']}';
        addressController.text = ' ${userProfileList['address']}';
        passportController.text = ' ${userProfileList['passport']}';
        // When upload pdf in profile details screen after updating widget for view pdf
        selectedImagePath = '';
        update();
      } else {
        Get.find<DashboardScreenController>().logout();
      }
    }
  }
  Future<void> completedSchedulePicture(date) async {
    final token = await box.read(UserDataKey.tokenKey);
    final targetId = await box.read(UserDataKey.currentTargetIdKey);
    if (token != null && targetId != null) {
      final response = await completedSchedulePictureRequest(token: token, id: targetId,date: date);
      if (response['success'] == true) {
        _completedSchedulePictureList = response['data'];
         update();
      }
    }
  }

  Future<void> completedTargetsVisit() async {
    final token = await box.read(UserDataKey.tokenKey);
     if (token != null  ) {
      final response = await completedTargetsVisitRequest(token);
       if (response['success'] == true) {
        _completedTargetVisitList = response['data'];
      }
    }
  }
  void progress(v){
    _isProgress = v;
    update();
  }
  // Initialize the controller
  Future<void> initializeMethod() async {
    progress(true); // Set progress state to true
     try {
      // Fetch user profile and other asynchronous operations
      await Future.wait([
        userProfile(),
        completedTargetsVisit(),
      ]);
    } catch (e) {
      throw Exception('$e');
    } finally {
       progress(false);
    }
  }

  // Update user profile on the server
  Future<void> userProfileEdit() async {
    progress(true); // Set progress state to true
     final token = await box.read(UserDataKey.tokenKey);
    if (token != null) {
      final response = await updateProfileRequest(
        token: token,
        name: nameController.text,
        designation: designationController.text,
        nid: nidController.text,
        address: addressController.text,
        certification: certificationController.text,
        passport: passportController.text,
      );
      if (response['success'] == true) {
        await initializeMethod(); // Refresh initializeMethod after successful update
        Get.back(); // Close the current screen
        progress(false); // Update progress state to false
       } else {
        progress(false); // Update progress state to false on unsuccessful update
       }
    }
  }

  // Handle the process of selecting an image
  Future<void> getImage(imageSource) async {
    Get.back(); // Close any existing screen
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      update();
      final token = await box.read(UserDataKey.tokenKey);
      if (token != null) {
        // Compress and upload the selected image
        final compressedImage = await compressImage(pickedFile.path);
        final response = await uploadImageRequest(
          path: compressedImage.path,
          token: token,
        );
        if (response['success'] == true) {
          await initializeMethod(); // Refresh user profile after successful image upload
        } else {
          Get.snackbar('Ohh..', 'Something went wrong!');
        }
      }
    } else {
      Get.snackbar('Ohh..', 'Something went wrong!');
    }
  }

  // Compress the selected image
  Future<PickedFile> compressImage(String imagePath) async {
    final File imageFile = File(imagePath);
    final img.Image? originalImage =
        img.decodeImage(imageFile.readAsBytesSync());

    // Resize and encode the image
    final img.Image compressedImage = img.copyResize(originalImage!,
        width: 800, height: 600, interpolation: img.Interpolation.linear);

    final List<int> compressedBytes =
        img.encodeJpg(compressedImage, quality: 85);

    // Save the compressed image to a new file
    final String compressedImagePath =
        "${imageFile.parent.path}/compressed_${imageFile.uri.pathSegments.last}";
    await File(compressedImagePath).writeAsBytes(compressedBytes);

    return PickedFile(compressedImagePath);
  }

  // Called when the controller is initialized
  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }
}