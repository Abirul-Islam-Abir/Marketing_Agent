import 'package:amin_agent/app/data/utils/const.dart';
import 'package:amin_agent/app/modules/auth%20screen/login%20screen/components/welcome_text.dart';
import 'package:amin_agent/app/modules/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/utils/app_images.dart';
import '../../../../data/utils/app_string.dart';
import '../../../../theme/app_color.dart';
import '../../../auth screen/login screen/components/login_button.dart';
import '../../../auth screen/otp verify screen/components/custom_pin_code_field.dart';
import '../../../auth screen/otp verify screen/components/enter_digit_code_send.dart';
import '../../../auth screen/otp verify screen/components/enter_digit_text.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/login_background_view.dart';
import '../controllers/password_set_screen_controller.dart';

class PasswordSetScreenView extends StatelessWidget {
  PasswordSetScreenView({super.key});

  final controller = Get.put(PasswordSetScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginBackgroundView(
          image: AppImages.loginScreenBackground,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomBackButton(),
                    SizedBox(height: 10.h),
                    WelcomeText(text:AppString.changePassword),
                    SizedBox(height: 5.h),
                    CustomTextField(
                        icon: IconButton(
                      onPressed: controller.isSecurePassChange,
                      icon: Icon(
                        controller.isSecurePass
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined,
                        color: AppColor.kWhiteColor,
                        size: 30,
                      ),
                    ),

                      keyboardType: TextInputType.number,
                      focusNode: controller.passwordFocus,
                        validator: validatePassword,
                        controller: controller.password,
                        hintText: 'new password',
                        img: AppImages.textFieldPass),
                    CustomTextField(
                        icon: IconButton(
                      onPressed: controller.isSecureCPassChange,
                      icon: Icon(
                        controller.isSecureCPass
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined,
                        color: AppColor.kWhiteColor,
                        size: 30,
                      ),
                    ),
                        keyboardType: TextInputType.number,
                      focusNode: controller.cPasswordFocus,
                        validator: validatePassword,
                        controller: controller.cPassword,
                        hintText: 'confirm password',
                        img: AppImages.textFieldPass),
                      SizedBox(height: 5.h),
                      SizedBox(height: 5.h),
                    Obx(() => LoginButton(
                      text: 'Continue ',
                      onTap:(){
                         controller.validateMethod(context);
                      },
                      isProgress: controller.isProgress,
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
