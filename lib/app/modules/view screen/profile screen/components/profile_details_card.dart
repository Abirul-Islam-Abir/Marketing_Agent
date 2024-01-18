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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        width: Get.width / 1.2,
        height: 80,
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
                    fontSize: 18,
                    color: AppColor.kWhiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
