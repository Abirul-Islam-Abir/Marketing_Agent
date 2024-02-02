import '../../../../data/const/export.dart';

class SalesTargetCard extends StatelessWidget {
  const SalesTargetCard({
    super.key,
    required this.name,
    required this.target,
    required this.completed,
    required this.progress,
    required this.dayLeft,
    required this.isMe,
  });

  final String name, target, completed, dayLeft;
  final String progress;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isMe
              ? AppColor.kGreenColor
              : AppColor.kWhiteColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: isMe ? AppColor.kYellowColor : null,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            color: AppColor.kWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '$completed / $target',
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
                        width: constraints.maxWidth * double.parse(progress),
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