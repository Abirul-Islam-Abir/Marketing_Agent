import '../../data/const/export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.name,
    this.onTap,
    required this.index, required this.selected,
  });

  final String name;
  final Function()? onTap;
  final int index;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index == selected
          ?   AppColor.kScaffoldBlue.withOpacity(0.9):AppColor.kSecondaryColor,
      child: ListTile(
        onTap: onTap,
        leading: const SizedBox(),
        title: Text(name, style: const TextStyle(color: AppColor.kWhiteColor)),
      ),
    );
  }
}