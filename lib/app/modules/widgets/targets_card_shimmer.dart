import 'package:shimmer/shimmer.dart';

import '../../data/const/export.dart';

class TargetsCardShimmer extends StatelessWidget {
  const TargetsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.kGreyColor ,
      highlightColor: AppColor.kShimmerWhite,
      child: InkWell(
        onTap: ( ){},
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                            color: AppColor.kWhiteColor,
                            fontWeight: FontWeight.w400,fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.supervisor_account_sharp,
                            color: AppColor.kWhiteColor,
                          ),
                          Text(
                            '',
                            style: TextStyle(
                                color: AppColor.kWhiteColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Text(
                  '',
                  style: TextStyle(
                      color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                            width: constraints.maxWidth *  0.0,
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
      ),
    );
  }
}