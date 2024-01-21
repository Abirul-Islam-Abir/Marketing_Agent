import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/const/export.dart';

// This is a StatelessWidget representing a screen for handling forget password functionality.
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  // Create an instance of the ForgetPasswordScreenController using the GetX library
  final controller = Get.put(ForgetPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PrimaryBackgroundView(
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // CustomBackButton is a widget representing a custom back button
                  const CustomBackButton(),
                  SizedBox(height: 15.h),
                  // BigText is a widget for displaying large text
                  BigText(text: AppString.forgetPasswords),
                  SizedBox(height: 5.h),
                  // CustomTextField is a widget for user input with an image (textFieldPhone) as a prefix
                  CustomTextField(
                    onEditingComplete: () {
                      // Call the validateMethod when editing is complete
                      controller.validateMethod(context);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    focusNode: controller.numberFocus,
                    controller: controller.number,
                    hintText: AppString.phone,
                    img: AppImages.textFieldPhone,
                  ),
                  SizedBox(height: 10.h),
                  // LoginButton is a widget representing a button for continuing the forget password process
                  Obx(() => LoginButton(
                    isProgress: controller.isProgress,
                    onTap: () {
                      // Call the validateMethod when the button is tapped
                      controller.validateMethod(context);
                    },
                    text: AppString.continues,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

