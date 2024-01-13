import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/const/export.dart';
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final controller = Get.put(ForgetPasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginBackgroundView(
          image: AppImages.loginScreenBackground,
          child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomBackButton(),
                    SizedBox(height: 15.h),
                    BigText(text: AppString.forgetPasswords),
                    SizedBox(height: 5.h),
                    CustomTextField(
                        focusNode: controller.numberFocus,
                        validator: validateMobile,
                        controller: controller.number,
                        hintText: AppString.phone,
                        img: AppImages.textFieldPhone),
                    SizedBox(height: 10.h),
                    Obx(() => LoginButton(
                        isProgress: controller.isProgress,
                        onTap: () {
                          controller.validateMethod(context);
                        },
                        text: AppString.continues)),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
