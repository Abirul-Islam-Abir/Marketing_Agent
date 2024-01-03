import '../../../../data/const/export.dart';

class CommissionReportCard extends StatelessWidget {
  const CommissionReportCard({
    super.key,
    required this.location,
    required this.target,
  });
  final String location, target;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width / 0.9,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              location,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.kWhiteColor,
                  fontSize: 20),
            ),
            Text(
              target,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.kWhiteColor,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}