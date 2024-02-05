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
      child: Obx(
        () => PinCodeTextField(
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
              if (v!.isEmpty) {
                controller.errorController!.add(ErrorAnimationType.shake);
                return "Blank OTP field!";
              } else if (controller.hasError.value == true) {
                controller.errorController!.add(ErrorAnimationType.shake);
                return 'OTP didn\'t match';
              } else if (controller.hasError.value == true && v.length == 4 ) {
                controller.errorController!.add(ErrorAnimationType.shake);
                return 'OTP didn\'t match';
              } else if (controller.errorText.value == 'Invalid OTP.') {
                controller.errorController!.add(ErrorAnimationType.shake);
                return 'OTP didn\'t match';
              } else {
                return null;
              }
            },
            errorTextSpace: 30,
            pinTheme: PinTheme(
                activeFillColor: AppColor.kWhiteColor,
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
            textStyle: TextStyle(
                color: controller.hasError.value
                    ? Colors.red
                    : AppColor.kWhiteColor,
                fontWeight: FontWeight.bold),
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
              if (value.isNotEmpty) {
                controller.hasError.value = false;
                controller.errorText.value = '';
              } else if (controller.hasError.value == true && value.length == 4 ) {
                controller.errorController!.add(ErrorAnimationType.shake);
              } else {
                return;
              }
            },
            beforeTextPaste: (text) {
              debugPrint("Allowing to paste $text");
              return true;
            }),
      ),
    );
  }
}