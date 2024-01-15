import '../../../../data/const/export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key, required this.name, required this.icon, this.onTap,
  });
  final String name;
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColor.kWhiteColor),
      title: Text(name,
          style: const TextStyle(color: AppColor.kWhiteColor)),
    );
  }
}