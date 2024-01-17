import '../../../../data/const/export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key, required this.name, required this.icon, this.onTap, required this.color,
  });
  final String name;
  final Function()? onTap;
  final IconData icon;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        tileColor: color,
        onTap: onTap,
        leading: Icon(icon, color: AppColor.kWhiteColor),
        title: Text(name,
            style: const TextStyle(color: AppColor.kWhiteColor)),
      ),
    );
  }
}