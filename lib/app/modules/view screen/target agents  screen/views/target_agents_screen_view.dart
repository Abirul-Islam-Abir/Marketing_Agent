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
        appBar: buildFilterAppBar(
          text: '${controller.allTargetsAgentsList['title']}',
          filterTap: () {
            Get.dialog(FilterScreenView());
          },
        ),
        body: ListView.builder(
          itemCount: data['agents'].length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            List agentsList = data['agents'];
            return SalesTargetCard(
              isMe: agentsList[index]['is_me'] ,
            dayLeft: data['days_left'],
            target: data['target_amount'],
            name: agentsList[index]['agent_name'],
            progress: agentsList[index]['progress'],
            completed: agentsList[index]['sell_amount'],
          );
          },
        ),
      );
    });
  }
}
