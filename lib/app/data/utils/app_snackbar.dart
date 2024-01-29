import 'package:get/get.dart';

class AppSnackbar{

static  pdfNotUploaded(){
  Get.showSnackbar(  GetSnackBar(
    title: 'Ohh!',
    message: 'Please upload pdf first!',
    duration: Duration(seconds: 1),
  ));
}
  AppSnackbar._();
}