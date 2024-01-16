import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';
import '../../filter screen/views/filter_screen_view.dart';
import '../components/build_listview.dart';

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
        body: SalesTargetListView(list: salesTargetGroupList),
      );
}
