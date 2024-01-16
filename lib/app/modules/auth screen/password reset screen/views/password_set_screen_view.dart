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
        body: PrimaryBackgroundView(
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
                    Obx(() => CustomTextField(
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(controller.cPasswordFocus);
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        obscureText: controller.isSecurePass,
                        icon: IconButton(
                            onPressed: controller.isSecurePassChange,
                            icon: Icon(
                              controller.isSecurePass
                                  ? Icons.remove_red_eye_sharp
                                  : Icons.remove_red_eye_outlined,
                              color: AppColor.kWhiteColor,
                              size: 30,
                            )),
                        focusNode: controller.passwordFocus,
                        validator: validatePassword,
                        controller: controller.password,
                        hintText: 'New Password',
                        img: AppImages.textFieldPass)),
                    Obx(() => CustomTextField(
                        onEditingComplete: () {
                          controller.validateMethod(context);
                        },
                        obscureText: controller.isSecureCPass,
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
                        textInputAction: TextInputAction.done,
                        hintText: 'Confirm Password',
                        img: AppImages.textFieldPass)),
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
