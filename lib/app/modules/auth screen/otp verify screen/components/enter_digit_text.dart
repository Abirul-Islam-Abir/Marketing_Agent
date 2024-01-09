import '../../../../data/const/export.dart';

class EnterDigitTextSend extends StatelessWidget {
  const EnterDigitTextSend(this.text,{
    super.key,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text!,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColor.kWhiteColor),
      ),
    );
  }
}