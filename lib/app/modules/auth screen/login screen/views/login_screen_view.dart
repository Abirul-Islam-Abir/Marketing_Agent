import 'package:amin_agent/app/data/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/utils/app_images.dart';
import '../../../../data/utils/app_string.dart';
import '../../../widgets/login_background_view.dart';
import '../../../widgets/custom_text_field.dart';
import '../components/forget_button.dart';
import '../components/login_button.dart';
import '../components/login_to_continue_text.dart';
import '../components/welcome_text.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({super.key});

  @override
  final controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginBackgroundView(
          image: AppImages.loginScreenBackground,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15.h),
                WelcomeText(text: AppString.welcome),
                LoginToContinueText(AppString.loginToContinue),
                SizedBox(height: 5.h),
                CustomTextField(
                    hintText: AppString.phone, img: AppImages.textFieldPhone),
                CustomTextField(
                    hintText: AppString.password, img: AppImages.textFieldPass),
                ForgetButton(
                    text: AppString.forgetPassword,
                    onPressed: () {
                      forgotPasswordDialog(
                        title: AppString.forgetPassword,
                        body:
                           AppString.sentCode4Digit,
                        tap: () {
                          Get.back();
                          inputVerifyPinDialog();
                          //
                        },
                      );
                    }),
                SizedBox(height: 10.h),
//
              ],
            ),
          ),
        ),
      ),
    );
  }
}
