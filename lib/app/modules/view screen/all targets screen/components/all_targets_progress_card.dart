import 'package:flutter_svg/svg.dart';

import '../../../../data/const/export.dart';

class AllTargetsProgressCard extends StatelessWidget {
  const AllTargetsProgressCard(
      {super.key,
      required this.text,
      required this.targetAmount,
      required this.amountCollected,
      required this.agentsCount,
      required this.progress,
      required this.isCurrent,
      required this.doctorTap,
      required this.agentTap, required this.testTap, required this.commissionTap, required this.salesTap});
  final String text, targetAmount, amountCollected;
  final int agentsCount;
  final String progress;
  final Function() doctorTap, agentTap,testTap,commissionTap,salesTap;
  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Container(
        height: 180,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCurrent
              ? AppColor.kOrangeColor.withOpacity(0.50)
              : AppColor.kWhiteColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                                fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.visible,
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
                        color: AppColor.kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        color: AppColor.kWhiteColor,
                        border:
                            Border.all(width: 2, color: AppColor.kWhiteColor),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) => Container(
                              width:
                                  constraints.maxWidth * double.parse(progress),
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
            Expanded(flex: 3,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: doctorTap,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColor.kYellowColor,
                          child: SvgPicture.asset(
                             AppImages.doctorSvg)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: agentTap,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColor.kPrimaryColor,
                          child: SvgPicture.asset(
                              AppImages.agentSvg)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: testTap,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColor.kWhiteColor,
                          child: SvgPicture.asset(
                              AppImages.testSvg)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: commissionTap,
                    child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColor.kWhiteColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                              AppImages.moneySvg),
                        )),
                  ), const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: salesTap,
                    child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColor.kOrangeColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                              AppImages.salesSvg),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}