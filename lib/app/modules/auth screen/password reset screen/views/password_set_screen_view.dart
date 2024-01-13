import 'package:amin_agent/app/modules/auth%20screen/password%20reset%20screen/controllers/password_set_screen_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

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
                    BigText(text: AppString.changePassword),
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
                            )),
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
                          onTap: () {
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
