 import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

 import '../../../../routes/app_pages.dart';
import '../../../connectivity/controller/internet_connectivity.dart';


 class SplashScreenController extends GetxController {
   // Map to store data retrieved from Firestore
   Map _data = {};

   // Getter for accessing the data
   Map get data => _data;

   // Method to check if the user is already logged in
   Future userAlreadyLogged() async {
     // Delay the execution for 3 seconds (for a splash screen effect)
     Future.delayed(const Duration(seconds: 3)).then((value) async {
       // Retrieve user authentication token
       final token = await box.read(UserDataKey.tokenKey);
       // Check if the token is not null or there's an internet connection
       if (token != null || NetworkController.connectionType != 0) {
         // Navigate to the bottom navigation screen with data as arguments
         Get.offAllNamed(RouteName.bottomNav, arguments: data);
       } else {
         // Navigate to the login screen if the user is not logged in
         Get.offAllNamed(RouteName.loginScreen,arguments: data);
       }
     });
   }

   // Method to retrieve data from Firestore
   Future<void> checkForUpdates() async {
     // Retrieve data from the 'mpo_flutter' collection in Firestore
     FirebaseFirestore.instance.collection('mpo_flutter').get().then((querySnapshot) {
       for (var doc in querySnapshot.docs) {
         // Store the retrieved data in the _data map
         _data = doc.data();
         // Check if the user is already logged in after retrieving data
         userAlreadyLogged();
       }
     });
   }

   // Called when the controller is initialized
   @override
   void onInit() {
     // Check for updates (retrieve data from Firestore)
     checkForUpdates();
     super.onInit();
   }
 }