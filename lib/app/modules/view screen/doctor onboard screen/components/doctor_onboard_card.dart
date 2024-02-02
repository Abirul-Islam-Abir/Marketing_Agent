import '../../../../data/const/export.dart';

class DoctorOnboardCard extends StatelessWidget {
  const DoctorOnboardCard({
    super.key,
    required this.location,
    required this.date, required this.time,
  });

  final String location, date,time;

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
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColor.kWhiteColor,
                      fontSize: 15),
                ),
                Text(
                  time,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColor.kWhiteColor,
                      fontSize: 15),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                Text(
                  location,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.kWhiteColor,
                      fontSize: 17),
                ),
                SizedBox(width: 10,)
              ],
            )
          ],
        ),
      ),
    );
  }
}