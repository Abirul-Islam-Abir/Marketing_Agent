


import '../../../../data/const/export.dart';
import '../../filter screen/views/filter_screen_view.dart';

class TotalSalesScreen extends GetView<TotalSalesScreeenController> {
  const TotalSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
               children: [
                  SecondaryAppBar(text: 'Sales',filterTap: () => Get.dialog(FilterScreenView())),
                TotalSalesListView(
                  list: salesReportDataList,
                )
              ],
            ),
          ),
        ),
      );
}
