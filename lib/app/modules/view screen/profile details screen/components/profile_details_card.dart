import '../../../../data/const/export.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard({
    super.key,
    required this.name,
    required this.label,
  });

  final String name, label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            AppColor.kSecondaryColor,
            AppColor.kPrimaryColor,
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: AppColor.kWhiteColor),
              ),
              const SizedBox(height: 5),
              Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.kWhiteColor),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
