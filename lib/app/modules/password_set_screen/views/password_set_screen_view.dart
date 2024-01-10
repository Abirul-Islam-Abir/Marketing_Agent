import 'package:amin_agent/app/data/utils/const.dart';
import 'package:amin_agent/app/modules/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/utils/app_images.dart';
import '../../../data/utils/app_string.dart';
import '../../auth screen/login screen/components/login_button.dart';
import '../../auth screen/otp verify screen/components/custom_pin_code_field.dart';
import '../../auth screen/otp verify screen/components/enter_digit_code_send.dart';
import '../../auth screen/otp verify screen/components/enter_digit_text.dart';
import '../../auth screen/otp verify screen/components/long_line_subtitle.dart';
import '../../auth screen/otp verify screen/controller/otp_verify_controller.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/login_background_view.dart';
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
              child: Column(
                children: [
                  const CustomBackButton(),
                  SizedBox(height: 15.h),
                  Column(
                    children: [
                      EnterDigitText(AppString.setPassword),
                      const SizedBox(height: 10),
                      EnterDigitTextSend(AppString.verifyOtpAndSetPassword),
                      SizedBox(height: 10.h),
                      CustomPinCodeField(otp: controller.otp),
                      CustomTextField(
                        validator: validatePassword,
                          controller: controller.password,
                          hintText: 'password',
                          img: AppImages.textFieldPass),
                      CustomTextField(
                          validator: validatePassword,
                          controller: controller.cPassword,
                          hintText: 'confirm password',
                          img: AppImages.textFieldPass),
                      const SizedBox(height: 50),
                      const SizedBox(height: 50),
                      Obx(() => LoginButton(
                            text: 'Continue ',
                            onTap: controller.validateMethod,
                            isProgress: controller.isProgress,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
