import '../../../../data/const/export.dart';

class AgentsTargetedProgressCard extends StatelessWidget {
  const AgentsTargetedProgressCard({
    super.key,
    required this.text,
    required this.agentsCount,
    required this.targetAmount,
    required this.amountCollected,
    required this.progress,
    required this.onTap,
    required this.isCurrent,
  });

  final String text, targetAmount, amountCollected;
  final int agentsCount;
  final String progress;
  final Function() onTap;
  final bool isCurrent;
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
            color: isCurrent
                ? AppColor.kGreenColor
                : AppColor.kWhiteColor.withOpacity(0.20),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: isCurrent ? AppColor.kYellowColor : null,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        style: const TextStyle(
                            color: AppColor.kWhiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),maxLines: 1,overflow: TextOverflow.visible,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.supervisor_account_sharp,
                            color: AppColor.kWhiteColor,
                          ),
                        ),
                        Text(
                          '$agentsCount',
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
                '$targetAmount / $amountCollected',
                style: const TextStyle(
                    color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
      ),
    );
  }
}