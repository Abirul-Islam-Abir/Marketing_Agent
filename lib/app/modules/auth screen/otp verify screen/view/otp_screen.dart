import 'package:amin_agent/app/modules/auth%20screen/login%20screen/components/login_button.dart';
import 'package:amin_agent/app/modules/widgets/custom_back_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../data/const/export.dart';
import '../../../../data/utils/app_images.dart';
import '../../../../data/utils/app_string.dart';
import '../../../widgets/login_background_view.dart';
import '../components/custom_pin_code_field.dart';
import '../components/enter_digit_code_send.dart';
import '../components/enter_digit_text.dart';
import '../components/long_line_subtitle.dart';
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CustomBackButton(),
                SizedBox(height: 15.h),
                Column(
                  children: [
                    EnterDigitText(AppString.enterDigitCode),
                    const SizedBox(height: 10),
                    EnterDigitTextSend(AppString.sentCode4Digit),
                    SizedBox(height: 10.h),
                    CustomPinCodeField(otp: controller.otp),
                    const SizedBox(height: 50),
                    Obx(() => LongLineSubtitleText(
                        text: AppString.thisCodeWillExpired,
                        txt: ' ${controller.countdown}s')),
                    Obx(() => LongLineSubtitleText(
                          text: AppString.didNotReceivedTheCode,
                          txt: controller.isTimeOut.value ? '' : ' RESEND',
                          onTap: () {
                            controller.startCountdown();
                          },
                        )),
                    const SizedBox(height: 50),
                    GetBuilder<OtpVerifyScreenController>(
                        builder: (_) => LoginButton(
                              text: 'Continue',
                              onTap: controller.otpVerifyInitializeMethod,
                              isProgress: controller.isProgress,
                            )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
