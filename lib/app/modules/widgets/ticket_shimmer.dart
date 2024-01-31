import 'package:shimmer/shimmer.dart';

import '../../data/const/export.dart';

class TicketShimmer extends StatelessWidget {
  const TicketShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: AppColor.kGreyColor,
        highlightColor: AppColor.kShimmerWhite,
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.kWhiteColor.withOpacity(0.10),
              border: Border.all(width: 2, color: AppColor.kGreyColor)),
          child: Center(
            child: Text(
              '',
              style: TextStyle(
                  color: AppColor.kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}