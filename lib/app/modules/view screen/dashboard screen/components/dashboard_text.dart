

import '../../../../data/const/export.dart';

class DashboardText extends StatelessWidget {
  const DashboardText(this.text,{
    super.key,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: AppColor.kWhiteColor),
    );
  }
}