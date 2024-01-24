import 'package:amin_agent/app/modules/widgets/targets_card_shimmer.dart';

import '../../data/const/export.dart';

class ShimmerTargetList extends StatelessWidget {
  const ShimmerTargetList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => const TargetsCardShimmer());
  }
}