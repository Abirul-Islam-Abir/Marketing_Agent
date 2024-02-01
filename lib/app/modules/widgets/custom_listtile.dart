import '../../data/const/export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key, required this.name,  this.onTap, required this.color,
  });
  final String name;
  final Function()? onTap;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        tileColor: color,
        onTap: onTap,
        leading: const SizedBox(),
        title: Text(name,
            style: const TextStyle(color: AppColor.kWhiteColor)),
      ),
    );
  }
}