import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
int selectedIndex = 0;
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

}
