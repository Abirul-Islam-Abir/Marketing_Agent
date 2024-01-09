
import '../../../../data/const/export.dart';

class ForgetPasswordScreenController extends GetxController {
  final   number = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;


  void validateSubmit() {

    if (formKey.currentState!.validate()) {

    }
  }



}