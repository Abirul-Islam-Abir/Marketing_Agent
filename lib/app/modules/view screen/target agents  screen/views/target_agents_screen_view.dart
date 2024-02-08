import '../../../../data/const/export.dart';
import '../components/sales_target_card.dart';
import '../controllers/targets_agents _screen_controller.dart';

class TargetAgentsScreenView extends StatelessWidget {
  TargetAgentsScreenView({super.key});
  final controller = Get.put(AgentsScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgentsScreenController>(builder: (controller) {
      final agentsData = controller.allTargetsAgentAppbar;
      return Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildNavigateAppbar(
          '${agentsData['title']??''}',
        ),
        body: SizedBox(
          height: double.infinity,
          child: ListView.builder(
            itemCount: controller.allTargetAgentsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final data = controller.allTargetAgentsList;
              final isMe = data[index]['is_me'];
              final dayLeft = agentsData['days_left'];
              final targetAmount = agentsData['target_amount'];
              final name = data[index]['agent_name'];
              final progress = data[index]['progress'];
              final sellAmount = data[index]['sell_amount'];
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