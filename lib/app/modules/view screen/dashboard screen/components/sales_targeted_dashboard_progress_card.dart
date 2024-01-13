
import '../../../../data/const/export.dart';


class SalesTargetedProgressCard extends StatelessWidget {
  const SalesTargetedProgressCard({
    super.key,
    required this.text,
    required this.collaborate,
    required this.totalSales,
    required this.totalCompletedSales,
    required this.progress, required this.onTap,
  });

  final String text, collaborate, totalSales, totalCompletedSales;
  final double progress;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                      text,
                      style: const TextStyle(
                          color: AppColor.kWhiteColor,
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.manage_accounts_rounded,
                          color: AppColor.kWhiteColor,
                        ),
                        Text(
                          collaborate,
                          style: const TextStyle(
                              color: AppColor.kWhiteColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '$totalSales/$totalCompletedSales',
                style: const TextStyle(
                    color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
              ),
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
                          width: constraints.maxWidth * 0.2,
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
      ),
    );
  }
}