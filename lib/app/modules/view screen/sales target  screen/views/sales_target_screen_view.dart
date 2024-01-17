import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';
import '../../filter screen/views/filter_screen_view.dart';

class SalesTargetScreenView extends GetView<SalesTargetScreenController> {
  const SalesTargetScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildFilterAppBar(
            text: 'Targets',
            filterTap: () {
              Get.dialog(FilterScreenView());
            }),
        body: ListView.builder(
          itemCount: salesTargetGroupList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => SalesTargetCard(
              dayLeft: '15 days left',
              target: salesTargetGroupList[index].target,
              name: salesTargetGroupList[index].name,
              progress: salesTargetGroupList[index].progress,
              completed: salesTargetGroupList[index].completed),
        )
      );
}
