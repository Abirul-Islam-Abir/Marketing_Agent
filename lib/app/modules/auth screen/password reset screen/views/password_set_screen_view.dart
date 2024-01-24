import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

// PasswordSetScreenView is a StatelessWidget for setting or changing a password.
class PasswordSetScreenView extends StatelessWidget {
  PasswordSetScreenView({super.key});

  // Create an instance of PasswordSetScreenController using GetX and put it into the GetX dependency injection system
  final _controller = Get.put(PasswordSetScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PrimaryBackgroundView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // CustomBackButton is a custom widget representing a back button
                    const CustomBackButton(),
                    SizedBox(height: 10.h),
                    // BigText is a custom widget for displaying large text
                    BigText(text: AppString.changePassword),
                    SizedBox(height: 5.h),
                    // Obx is a GetX widget that rebuilds when the observable value changes
                    Obx(() => CustomTextField(
                        onEditingComplete: () {
                          // Move focus to the confirm password field
                          FocusScope.of(context)
                              .requestFocus(_controller.cPasswordFocus);
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        // Toggle password visibility based on the observable value
                        obscureText: _controller.isSecurePass,
                        icon: IconButton(
                            onPressed: _controller.isSecurePassChange,
                            icon: Icon(
                              // Show/hide password icon based on the observable value
                              _controller.isSecurePass
                                  ? Icons.remove_red_eye_sharp
                                  : Icons.remove_red_eye_outlined,
                              color: AppColor.kWhiteColor,
                              size: 30,
                            )),
                        focusNode: _controller.passwordFocus,
                        // Validate password input using a validator function
                        validator: validatePassword,
                        controller: _controller.password,
                        hintText: 'New Password',
                        img: AppImages.textFieldPass)),
                    // Obx is a GetX widget that rebuilds when the observable value changes
                    Obx(() => CustomTextField(
                        onEditingComplete: () {
                          // Validate the form when the confirm password field is submitted
                          _controller.validateMethod(context);
                        },
                        // Toggle password visibility based on the observable value
                        obscureText: _controller.isSecureCPass,
                        icon: IconButton(
                          onPressed: _controller.isSecureCPassChange,
                          icon: Icon(
                            // Show/hide password icon based on the observable value
                            _controller.isSecureCPass
                                ? Icons.remove_red_eye_sharp
                                : Icons.remove_red_eye_outlined,
                            color: AppColor.kWhiteColor,
                            size: 30,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        focusNode: _controller.cPasswordFocus,
                        // Validate password input using a validator function
                        validator: validatePassword,
                        controller: _controller.cPassword,
                        textInputAction: TextInputAction.done,
                        hintText: 'Confirm Password',
                        img: AppImages.textFieldPass)),
                    SizedBox(height: 5.h),
                    SizedBox(height: 5.h),
                    // Obx is a GetX widget that rebuilds when the observable value changes
                    Obx(() => LoginButton(
                      text: 'Continue ',
                      onTap: () {
                        // Validate the form and initiate the password setting process
                        _controller.validateMethod(context);
                      },
                      // Disable the button when the password setting process is in progress
                      isProgress: _controller.isProgress,
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

