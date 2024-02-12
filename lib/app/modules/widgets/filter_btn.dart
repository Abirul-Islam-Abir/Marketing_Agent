import '../../data/const/export.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({
    super.key, required this.onTap,
  });
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: onTap ,
              icon:  const Icon(Icons.filter_alt,color: AppColor.kPrimaryColor,)
                )),
    );
  }
}