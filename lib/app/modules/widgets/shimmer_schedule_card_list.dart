import 'package:amin_agent/app/modules/widgets/shimmer_card_schedule.dart';

import '../../data/const/export.dart';

class SimmerScheduleCardList extends StatelessWidget {
  const SimmerScheduleCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scheduleList.length,
      itemBuilder: (context, index) {
        return const ScheduleShimmerCard();
      },
    );
  }
}
