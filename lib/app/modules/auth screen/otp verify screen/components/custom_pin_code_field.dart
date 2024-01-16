import '../../../../data/const/export.dart';

class CustomPinCodeField extends StatelessWidget {
  CustomPinCodeField({
    super.key,
    required this.otp,
    this.onCompleted,
  });

  final TextEditingController? otp;
  final void Function(String)? onCompleted;
  final controller = Get.put(OtpVerifyScreenController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: PinCodeTextField(
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
          validator: (v) {
            if (v!.length < 3) {
              return "Type your pin code";
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              activeColor: AppColor.kWhiteColor,
              inactiveColor: AppColor.kWhiteColor,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 50,
              activeFillColor: AppColor.kWhiteColor,
              selectedColor: AppColor.kWhiteColor,
              selectedFillColor: AppColor.kWhiteColor,
              inactiveFillColor: AppColor.kWhiteColor,
              disabledColor: AppColor.kWhiteColor,
              errorBorderColor: AppColor.kWhiteColor),
          textStyle: const TextStyle(color: AppColor.kWhiteColor,fontWeight: FontWeight.bold),
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
          onChanged: (value) {},
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            return true;
          }),
    );
  }
}
