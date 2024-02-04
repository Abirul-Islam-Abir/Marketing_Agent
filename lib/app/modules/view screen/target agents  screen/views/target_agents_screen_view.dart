import '../../../../data/const/export.dart';
import '../components/sales_target_card.dart';
import '../controllers/targets_agents _screen_controller.dart';

class TargetAgentsScreenView extends StatelessWidget {
  TargetAgentsScreenView({Key? key}) : super(key: key);
  final controller = Get.put(AgentsScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgentsScreenController>(builder: (controller) {
      // Check if data is null, and handle it accordingly
      if (controller.isProgress) {
        return const Scaffold(body: ShimmerTargetList());
      }
      final data = controller.allTargetsAgentsList;

      return Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildNavigateAppbar(
          '${controller.allTargetsAgentsList['title']}',
        ),
        body: SizedBox(
          height: double.infinity,
          child: ListView.builder(
            itemCount: data['agents'].length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              List agentsList = data['agents'];
              final isMe = agentsList[index]['is_me'];
              final dayLeft = data['days_left'];
              final targetAmount = data['target_amount'];
              final name = agentsList[index]['agent_name'];
              final progress = agentsList[index]['progress'];
              final sellAmount = agentsList[index]['sell_amount'];
              return SalesTargetCard(
                isMe: isMe,
                dayLeft: dayLeft,
                target: targetAmount,
                name: name,
                progress: progress,
                completed: sellAmount,
              );
            },
          ),
        ),
      );
    });
  }
}