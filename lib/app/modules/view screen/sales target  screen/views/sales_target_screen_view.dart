



import '../../../../data/const/export.dart';
import '../../filter screen/views/filter_screen_view.dart';
import '../../notification screen/components/build_listview.dart';

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
                  child: SalesTargetListView(list: salesTargetGroupList),
                ),
              ],
            ),
          ),
        ),
      );
}




