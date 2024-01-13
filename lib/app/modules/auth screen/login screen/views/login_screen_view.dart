import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

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
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  BigText(text: AppString.welcome),
                  LoginToContinueText(AppString.loginToContinue),
                  SizedBox(height: 5.h),
                  CustomTextField(
                    focusNode: controller.numberFocus,
                    validator: validateMobile,
                    controller: controller.number,
                    hintText: AppString.phone,
                    img: AppImages.textFieldPhone,
                  ),
                  Obx(
                    () => CustomTextField(
                      onFieldSubmitted: (v){
                        controller.validateMethod(context);
                      },
                      textInputAction: TextInputAction.done,
                       focusNode: controller.passFocus,
                      obscureText: controller.isSecure,
                      validator: validatePassword,
                      controller: controller.password,
                      hintText: AppString.password,
                      img: AppImages.textFieldPass,
                      icon: IconButton(
                        onPressed: controller.isSecureChange,
                        icon: Icon(
                          controller.isSecure
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined,
                          color: AppColor.kWhiteColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  ForgetButton(
                      text: AppString.forgetPassword,
                      onPressed: () {
                        Get.toNamed(RouteName.forgetPasswordScreen);
                      }),
                  SizedBox(height: 10.h),
                  GetBuilder<LoginScreenController>(
                      builder: (_) => LoginButton(
                          isProgress: controller.isProgress,
                          text: AppString.login,
                          onTap: () {
                             controller.validateMethod(context);
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
