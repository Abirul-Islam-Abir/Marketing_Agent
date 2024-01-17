import '../../../../data/const/export.dart';

class CustomPinCodeField extends StatelessWidget {
  CustomPinCodeField({
    Key? key,
    required this.otp,
    this.onCompleted,
  }) : super(key: key);

  final TextEditingController? otp;
  final void Function(String)? onCompleted;
  final controller = Get.put(OtpVerifyScreenController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Obx(() => PinCodeTextField(
          focusNode: controller.otpFocus,
          appContext: context,
          autoFocus: true,
          pastedTextStyle: const TextStyle(
              color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
          length: 4,
          obscureText: false,
          obscuringCharacter: '*',
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          errorAnimationController: controller.errorController,
          validator: (v) {
            if (v!.length < 4) {
              controller.errorController!.add(ErrorAnimationType.shake);
              return "Blank OTP field!";
            } else if (controller.errorText == 'Invalid OTP.') {
              controller.errorController!.add(ErrorAnimationType.shake);
              controller.hasError.value = true;
              return "OTP did not match!";
            } else {
              return null;
            }
          },
          errorTextSpace: 30,
          pinTheme: PinTheme(
              activeFillColor:
                  controller.hasError.value ? Colors.red : AppColor.kWhiteColor,
              shape: PinCodeFieldShape.box,
              activeColor: AppColor.kWhiteColor,
              inactiveColor: AppColor.kWhiteColor,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 50,
              selectedColor: AppColor.kWhiteColor,
              selectedFillColor: AppColor.kWhiteColor,
              inactiveFillColor: AppColor.kWhiteColor,
              disabledColor: AppColor.kWhiteColor,
              errorBorderColor: AppColor.kRedColor),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textStyle: const TextStyle(
              color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
          cursorColor: AppColor.kWhiteColor,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: false,
          controller: otp,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
                offset: Offset(0, 1),
                color: AppColor.kWhiteColor,
                blurRadius: 10)
          ],
          onCompleted: onCompleted,
          onChanged: (value) {
            controller.otpRemovedValidate();
          },
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            return true;
          })),
    );
  }
}
