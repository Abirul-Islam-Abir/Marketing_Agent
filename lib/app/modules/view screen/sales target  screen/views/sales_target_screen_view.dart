



import '../../../../data/const/export.dart';
import '../../filter screen/views/filter_screen_view.dart';

class SalesTargetScreenView extends GetView<SalesTargetScreenController> {
  const SalesTargetScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
               children: [
                  SecondaryAppBar(text: 'Targets',filterTap: () => Get.dialog(FilterScreenView())),
                Expanded(
                  child: ListView.builder(
                    itemCount: salesTargetGroupList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SalesTargetCard(
                        dayLeft: '15 days left',
                        target: salesTargetGroupList[index].target,
                        name: salesTargetGroupList[index].name,
                        progress: salesTargetGroupList[index].progress,
                        completed: salesTargetGroupList[index].completed),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}


