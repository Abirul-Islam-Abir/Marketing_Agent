import 'package:get/get.dart';

import '../../../../api services/auth/user_profile.dart';

class ProfileScreenController extends GetxController {
int selectedIndex = 0;
Map userProfileList = {};
void increment(){
  selectedIndex = 1;
  update();
}
void decrement(){
  selectedIndex = 0;
  update();
}

double progress = 0.0;
void updateValue(v){
  progress = v;
  update();
}

Future userProfile()async{
  final response = await userProfileRequest();
  userProfileList = response['data']['user'];

}


Future<void> userProfileInitializeMethod( ) async {
  try {
    await Future.wait([
    userProfile(),
    ]);
  } catch (e) {
    throw Exception('$e');
  } finally {
  }
}
@override
  void onInit() {
  userProfileInitializeMethod();
     super.onInit();
  }
}
