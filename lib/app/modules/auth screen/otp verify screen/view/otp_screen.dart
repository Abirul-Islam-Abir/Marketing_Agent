import 'package:amin_agent/app/modules/auth%20screen/login%20screen/components/login_button.dart';
import 'package:amin_agent/app/modules/widgets/custom_back_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';
import '../../../../data/utils/app_images.dart';
import '../../../widgets/login_background_view.dart';
import '../components/custom_pin_code_field.dart';
import '../components/enter_digit_code_send.dart';
import '../components/enter_digit_text.dart';
import '../controller/otp_verify_controller.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({super.key});

  final controller = Get.put(OtpVerifyScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginBackgroundView(
          image: AppImages.loginScreenBackground,
          child: Center(
            child: Column(
              children: [
                const CustomBackButton(),
                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        const EnterDigitText('Enter 4 digit code'),
                        const SizedBox(height: 10),
                        const EnterDigitTextSend(
                            'Enter the 4 digit code that send to your phone.'),
                        const SizedBox(height: 50),
                        CustomPinCodeField(otp: controller.otp),
                        const SizedBox(height: 50),
                        GetBuilder<OtpVerifyScreenController>(
                            builder: (_) => LoginButton(
                                  text: 'Continue',
                                  onTap: controller.otpVerifyInitializeMethod,
                                  isProgress: controller.isProgress,
                                )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
