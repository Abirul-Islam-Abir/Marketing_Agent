import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../data/const/export.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({
    super.key,
    required this.otp,
  });

  final TextEditingController? otp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold),
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
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 40,
              fieldWidth: 40,
              activeFillColor: AppColor.kWhiteColor),
          cursorColor: AppColor.kPrimaryColor,
          animationDuration:
          const Duration(milliseconds: 300),
          enableActiveFill: false,
          controller:  otp,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
                offset: Offset(0, 1),
                color: AppColor.kPrimaryColor,
                blurRadius: 10)
          ],
          onCompleted: (v) {},
          onChanged: (value) {},
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            return true;
          }),
    );
  }
}