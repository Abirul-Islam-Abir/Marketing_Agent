import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

// OtpVerifyScreen is a stateless widget for OTP verification screen.
class OtpVerifyScreen extends StatelessWidget {
  // GetX controller for managing the state and logic of the OTP verification screen
  final _controller = Get.put(OtpVerifyScreenController());

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
                  // Custom back button for navigation
                  const CustomBackButton(),
                  SizedBox(height: 15.h),
                  Form(
                    key: _controller.formKey,
                    child: Column(
                      children: [
                        // Heading for OTP code
                        BigText(text: AppString.otpCode),
                        // Subtitle for entering the OTP code
                        LoginToContinueText(AppString.enterDigitCode),
                        SizedBox(height: 10.h),
                        // Custom pin code field for entering OTP
                        CustomPinCodeField(
                          otp: _controller.otp,
                          onCompleted: (v) {
                            _controller.validateSubmit(context);
                          },
                        ),
                        const SizedBox(height: 30),
                        // Subtitle displaying the countdown for OTP expiration
                        Obx(() => LongLineSubtitleText(
                          text: AppString.thisCodeWillExpired,
                          txt:
                          '  ${_controller.countdown ~/ 60}:${(_controller.countdown % 60).toString().padLeft(2, '0')}s',
                        )),
                        // Button for resending OTP or indicating it has been resent
                        Obx(() => ReceivedCodeTextButton(
                          text: AppString.didNotReceivedTheCode,
                          txt: _controller.isTimeOut.value
                              ? ''
                              : '\n \nResend it',
                          onTap: () {
                            _controller.resendOtp(context);
                            _controller.startCountdown();
                          },
                        )),
                        const SizedBox(height: 30),
                        // Continue button for submitting the OTP
                        Obx(() => _controller.isCompleted
                            ? Container()
                            : LoginButton(
                          text: 'Continue ',
                          onTap: () {
                            _controller.validateSubmit(context);
                          },
                          isProgress: _controller.isProgress,
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

