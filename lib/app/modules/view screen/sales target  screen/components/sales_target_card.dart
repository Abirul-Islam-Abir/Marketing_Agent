import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class SalesTargetCard extends StatelessWidget {
  const SalesTargetCard({
    super.key,
    required this.name,
    required this.target,
    required this.completed,
    required this.progress,
    required this.dayLeft,
  });

  final String name, target, completed, dayLeft;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: AppColor.kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Text(
                  '\$$completed/\$$target',
                  style: const TextStyle(
                      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Time: $dayLeft',
                  style: const TextStyle(
                      color: AppColor.kWhiteColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Container(
                height: 15,
                decoration: BoxDecoration(
                  color: AppColor.kWhiteColor,
                  border: Border.all(width: 2, color: AppColor.kWhiteColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) => Container(
                        width: constraints.maxWidth * progress,
                        decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}