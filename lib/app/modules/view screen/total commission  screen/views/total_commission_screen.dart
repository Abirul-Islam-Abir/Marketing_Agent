import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';
import '../../filter screen/views/filter_screen_view.dart';

class TotalCommissionScreen extends StatelessWidget {
  TotalCommissionScreen({Key? key}) : super(key: key);

  final controller = Get.put(TotalCommissionScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColor.kSecondaryColor,
        appBar: buildFilterAppBar(
            text: 'Commissions',
            filterTap: () {
              Get.dialog(FilterScreenView());
            }),
        body: TotalCommissionListView(list: commissionDataList),
      );
}
