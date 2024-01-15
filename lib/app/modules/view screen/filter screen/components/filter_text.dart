import '../../../../data/const/export.dart';

class FilterText extends StatelessWidget {
  const FilterText(
      this.text, {
        super.key,
      });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text!,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.kSecondaryColor,
        ),
      ),
    );
  }
}