import 'package:flutter_svg/svg.dart';

import '../../../../data/const/export.dart';

class AllTargetsProgressCard extends StatelessWidget {
  const AllTargetsProgressCard({super.key, required this.text, required this.targetAmount, required this.amountCollected, required this.agentsCount, required this.progress,   required this.isCurrent, required this.doneTap, required this.sendTap});
  final String text, targetAmount, amountCollected;
  final int agentsCount;
  final String progress;
  final Function()  doneTap,sendTap;
  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
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
            Expanded(
              flex: 1,
              child:   Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              InkWell(
                onTap: doneTap,
                child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.kPrimaryColor,
                    child: SvgPicture.asset(
                        'assets/svg/doctor-svgrepo-com (1).svg')),
              ),const SizedBox(height: 10,), InkWell(
                onTap: sendTap,
                child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.kPrimaryColor,
                    child: SvgPicture.asset(
                        'assets/svg/agent-seller-svgrepo-com.svg')),
              ),
            ],),)
          ],
        ),
      ),
    );
  }
}