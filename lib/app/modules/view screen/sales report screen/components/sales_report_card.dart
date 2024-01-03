import '../../../../data/const/export.dart';

class SalesReportCard extends StatelessWidget {
  const SalesReportCard({
    super.key,
    required this.invoiceNb,
    required this.date,
    required this.name,
    required this.target,
  });

  final String invoiceNb, date, name, target;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width / 0.9,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  invoiceNb,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColor.kWhiteColor,
                      fontSize: 15),
                ),
                Text(
                  date,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColor.kWhiteColor,
                      fontSize: 15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.kWhiteColor,
                      fontSize: 20),
                ),
                Text(
                  target,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.kWhiteColor,
                      fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}