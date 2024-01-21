import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

// LoginScreenView is a GetX view class representing the UI for a login screen.
class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({super.key});

  // Create an instance of LoginScreenController using GetX and put it into the GetX dependency injection system
  final LoginScreenController _controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PrimaryBackgroundView(
          child: SingleChildScrollView(
            child: Form(
              key: _controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  // BigText is a widget displaying large text
                  BigText(text: AppString.welcome),
                  // LoginToContinueText is a custom widget for displaying text
                  LoginToContinueText(AppString.loginToContinue),
                  SizedBox(height: 5.h),
                  // CustomTextField is a custom widget for text input
                  CustomTextField(
                    onEditingComplete: () {
                      // Move focus to the password field when editing is complete
                      FocusScope.of(context)
                          .requestFocus(_controller.passFocus);
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _controller.numberFocus,
                    validator: validateMobile,
                    controller: _controller.number,
                    hintText: AppString.phone,
                    img: AppImages.textFieldPhone,
                  ),
                  // Obx is a GetX widget that rebuilds when the observable value changes
                  Obx(
                    () => CustomTextField(
                      keyboardType: TextInputType.number,
                      onEditingComplete: () {
                        // Validate and process login when editing is complete
                        _controller.validateMethod(context);
                      },
                      textInputAction: TextInputAction.done,
                      focusNode: _controller.passFocus,
                      obscureText: _controller.isSecure,
                      validator: validatePassword,
                      controller: _controller.password,
                      hintText: AppString.password,
                      img: AppImages.textFieldPass,
                      // IconButton for toggling password visibility
                      icon: IconButton(
                        onPressed: _controller.isSecureChange,
                        icon: Icon(
                          _controller.isSecure
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined,
                          color: AppColor.kWhiteColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  // ForgetButton is a custom button widget for initiating the forgot password process
                  ForgetButton(
                    text: AppString.forgetPassword,
                    onPressed: () {
                      // Navigate to the forget password screen
                      Get.toNamed(RouteName.forgetPasswordScreen);
                    },
                  ),
                  SizedBox(height: 10.h),
                  // GetBuilder is a GetX widget for rebuilding based on the state of LoginScreenController
                  GetBuilder<LoginScreenController>(
                    builder: (_) => LoginButton(
                      isProgress: _controller.isProgress,
                      text: AppString.login,
                      onTap: () async {
                        // Validate and process login when the login button is tapped
                        _controller.validateMethod(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
