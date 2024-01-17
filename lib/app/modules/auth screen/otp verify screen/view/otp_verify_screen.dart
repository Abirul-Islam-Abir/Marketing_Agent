import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({super.key});
  final controller = Get.put(OtpVerifyScreenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PrimaryBackgroundView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomBackButton(),
                  SizedBox(height: 15.h),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        BigText(text: AppString.otpCode),
                        LoginToContinueText(AppString.enterDigitCode),
                        SizedBox(height: 10.h),
                        CustomPinCodeField(
                            otp: controller.otp,
                            onCompleted: (v) {
                              controller.validateSubmit(context);
                            }),
                        const SizedBox(height: 30),
                        Obx(() => LongLineSubtitleText(
                              text: AppString.thisCodeWillExpired,
                              txt:
                                  '  ${controller.countdown ~/ 60}:${(controller.countdown % 60).toString().padLeft(2, '0')}s',
                            )),
                        Obx(() => ReceivedCodeTextButton(
                              text: AppString.didNotReceivedTheCode,
                              txt: controller.isTimeOut.value
                                  ? ''
                                  : '\n \nResend it',
                              onTap: () {
                                controller.resendOtp(context);
                                controller.startCountdown();
                              },
                            )),
                        const SizedBox(height: 30),
                        Obx(() => controller.isCompleted
                            ? Container()
                            : LoginButton(
                                text: 'Continue ',
                                onTap: () {
                                  controller.validateSubmit(context);
                                },
                                isProgress: controller.isProgress,
                              )),
                        const SizedBox(height: 20),
                      ],
                    ),
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
