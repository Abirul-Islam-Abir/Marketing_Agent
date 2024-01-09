import '../../../../data/const/export.dart';

class EnterDigitText extends StatelessWidget {
  const EnterDigitText(this.text,{
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
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColor.kWhiteColor),
      ),
    );
  }
}